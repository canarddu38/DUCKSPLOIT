<?php
print_r("Nom du Plat: ");
echo htmlspecialchars($_POST['name']);
echo ("<br>");

print_r("Tarif: ");
echo (int)($_POST['price']);
echo ("<br>");

print_r("Date De Disponibilité: ");
echo (int)($_POST['date']);
echo ("<br>");

print_r("onditionnement: ");
echo (int)($_POST['condi']);
echo ("<br>");

print_r("Stock: ");
echo (int)($_POST['stock']);
echo ("<br>");

print_r("Date Limite de Consomation: ");
echo (int)($_POST['dlc']);
echo ("<br>");

print_r("Date Limite de vente: ");
echo (int)($_POST['dlv']);
echo ("<br>");

$file = file_get_contents('wcpt_tables.json');

$json = json_decode($file, true);


// change $json var
$map = "[test: test]";

$json = json_encode($json, $map);





//write json to file

if (file_put_contents("wcpt_tables.json", $json))
    echo "done!";
else 
    echo "Oops! Error creating json file...";

?>