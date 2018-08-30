Import-Module ActiveDirectory
Import-Csv "c:\pokon\loginy.csv" | ForEach-Object {
$samAccountName = $_.login
Set-ADUser -Identity $samAccountName | Disable-ADAccount
}
