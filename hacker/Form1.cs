using System;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Windows.Forms;
using System.Text;
using System.IO;
using System.Diagnostics;
using System.ComponentModel;
using System.Linq;
using System.Net;
using System.Collections.Generic;
using System.IO.Compression;
using System.Web;
using System.Threading;
using System.Text.RegularExpressions;
using System.Reflection;
using System.Runtime.InteropServices;
using Microsoft.VisualBasic;

namespace installer;

public partial class Form1 : Form
{
    public Form1()
    {
		ServicePointManager.Expect100Continue = true;
		ServicePointManager.SecurityProtocol = (SecurityProtocolType)(0xc00);
        InitializeComponent();
    }
}
