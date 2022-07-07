Function ConvertFrom-NSS
{
    Param
    (
        [Parameter(Position = 0, Mandatory = $true)]
        [String[]] $Data,

        [Parameter(Position = 1, Mandatory = $true)]
        [String] $ProfileDir
    )

    # Search for the nss3.dll file
    $locations = @(
        Join-Path $env:ProgramFiles 'Mozilla Firefox'
        Join-Path ${env:ProgramFiles(x86)} 'Mozilla Firefox'
        Join-Path $env:ProgramFiles 'Nightly'
        Join-Path ${env:ProgramFiles(x86)} 'Nightly'
    )

    [String] $NSSDll = ''
    foreach($loc in $locations)
    {
        $nssPath = Join-Path $loc 'nss3.dll'
        if(Test-Path $nssPath)
        {
            $NSSDll = $nssPath
            break
        }
    }
    if($NSSDll -eq '')
    {
        return $NULL
    }

    # Based on https://devblogs.microsoft.com/scripting/use-powershell-to-interact-with-the-windows-api-part-3/

    # Create the ModuleBuilder
    $DynAssembly = New-Object System.Reflection.AssemblyName('NSSLib')
    $AssemblyBuilder = [AppDomain]::CurrentDomain.DefineDynamicAssembly($DynAssembly, [Reflection.Emit.AssemblyBuilderAccess]::Run)
    $ModuleBuilder = $AssemblyBuilder.DefineDynamicModule('NSSLib', $False)

    # Define a new class
    $TypeBuilder = $ModuleBuilder.DefineType('NSS', 'Public, Class')
    $DllImportConstructor = [Runtime.InteropServices.DllImportAttribute].GetConstructor(@([String]))
    $FieldArray = [Reflection.FieldInfo[]] @(
        [Runtime.InteropServices.DllImportAttribute].GetField('EntryPoint'),
        [Runtime.InteropServices.DllImportAttribute].GetField('PreserveSig'),
        [Runtime.InteropServices.DllImportAttribute].GetField('SetLastError'),
        [Runtime.InteropServices.DllImportAttribute].GetField('CallingConvention'),
        [Runtime.InteropServices.DllImportAttribute].GetField('CharSet')
    )

    # Define NSS_Init
    $PInvokeMethodInit = $TypeBuilder.DefineMethod(
        'NSS_Init',
        [Reflection.MethodAttributes] 'Public, Static',
        [Int],
        [Type[]] @([String]))
    $FieldValueArrayInit = [Object[]] @(
        'NSS_Init',
        $True,
        $True,
        [Runtime.InteropServices.CallingConvention]::Winapi,
        [Runtime.InteropServices.CharSet]::ANSI
    )
    $SetLastErrorCustomAttributeInit = New-Object Reflection.Emit.CustomAttributeBuilder(
        $DllImportConstructor,
        @($NSSDll),
        $FieldArray,
        $FieldValueArrayInit)
    $PInvokeMethodInit.SetCustomAttribute($SetLastErrorCustomAttributeInit)

    # Define SecItem Struct
    $StructAttributes = 'AutoLayout, AnsiClass, Class, Public, SequentialLayout, Sealed, BeforeFieldInit'
    $StructBuilder = $ModuleBuilder.DefineType('SecItem', $StructAttributes, [System.ValueType])
    $StructBuilder.DefineField('type', [int], 'Public') | Out-Null
    $StructBuilder.DefineField('data', [IntPtr], 'Public') | Out-Null
    $StructBuilder.DefineField('len', [int], 'Public') | Out-Null
    $SecItemType = $StructBuilder.CreateType()

    # Define PK11SDR_Decrypt
    $PInvokeMethodDecrypt = $TypeBuilder.DefineMethod(
        'PK11SDR_Decrypt',
        [Reflection.MethodAttributes] 'Public, Static',
        [Int],
        [Type[]] @($SecItemType, $SecItemType.MakeByRefType()))
    $FieldValueArrayDecrypt = [Object[]] @(
        'PK11SDR_Decrypt',
        $True,
        $True,
        [Runtime.InteropServices.CallingConvention]::Winapi,
        [Runtime.InteropServices.CharSet]::Unicode
    )
    $SetLastErrorCustomAttributeDecrypt = New-Object Reflection.Emit.CustomAttributeBuilder(
        $DllImportConstructor,
        @($NSSDll),
        $FieldArray,
        $FieldValueArrayDecrypt)
    $PInvokeMethodDecrypt.SetCustomAttribute($SetLastErrorCustomAttributeDecrypt)

    $NSS = $TypeBuilder.CreateType()

    # Initiate the NSS library
    $NSS::NSS_Init($ProfileDir) | Out-Null

    $decryptedArray = New-Object System.Collections.ArrayList
    foreach($dataPart in $Data)
    {
        # Decode data into bytes and marshal them into a pointer
        $dataBytes = [System.Convert]::FromBase64String($dataPart)
        $dataPtr = [System.Runtime.InteropServices.Marshal]::AllocHGlobal($dataBytes.Length)
        [System.Runtime.InteropServices.Marshal]::Copy($dataBytes, 0, $dataPtr, $dataBytes.Length)

        # Set up structures
        $encrypted = [Activator]::CreateInstance($SecItemType)
        $encrypted.type = 0
        $encrypted.data = $dataPtr
        $encrypted.len = $dataBytes.Length

        $decrypted = [Activator]::CreateInstance($SecItemType)
        $decrypted.type = 0
        $decrypted.data = [IntPtr]::Zero
        $decrypted.len = 0

        # Decrypt the data
        $NSS::PK11SDR_Decrypt($encrypted, [ref] $decrypted) | Out-Null

        # Get string data back out
        $bytePtr = $decrypted.data
        $byteData = [byte[]]::new($decrypted.len)
        [System.Runtime.InteropServices.Marshal]::Copy($bytePtr, $byteData, 0, $decrypted.len)
        $dataStr = [System.Text.Encoding]::UTF8.GetString($byteData)

        # Add the result to the array
        $decryptedArray.Add($dataStr) | Out-Null

        # Deallocate the pointer memory
        [System.Runtime.InteropServices.Marshal]::FreeHGlobal($dataPtr)
    }
    
    return $decryptedArray.ToArray()
}