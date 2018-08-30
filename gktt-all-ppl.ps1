
$tt='OU=TT People,OU=TT Users,DC=tt,DC=com,DC=pl'
$ttms='OU=TTMS Users,OU=TTMS,DC=tt,DC=com,DC=pl'
$ttpsc='OU=TTPSC People,OU=TTPSC Users,OU=TTPSC,DC=tt,DC=com,DC=pl'
$ttas='OU=TTAS People,OU=TTAS Users,OU=TTAS,DC=tt,DC=com,DC=pl'
$ou=$tt,$ttms,$ttpsc,$ttas 
$ou | foreach {Get-ADUser -Filter {Enabled -eq $true} -SearchBase $_  -Properties Name,department, mail, LastLogondate, whenCreated} | 
Select-Object Name,department, mail, lastlogondate, whenCreated | Sort-Object -Descending -Property lastlogondate |  Export-Csv 'D:\przemo\gktt\gkt_tt_all1.csv' -Encoding UTF8 -NoTypeInformation 