﻿Import-Module ActiveDirectory
Import-Csv "c:\pokon\loginy.csv" | ForEach-Object {
$samAccountName = $_.login
Set-ADUser -Identity $samAccountName -Description "Konto zablokowane / 30.03.2018 / ID"
}
