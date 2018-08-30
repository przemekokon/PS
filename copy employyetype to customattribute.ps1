Import-Module ActiveDirectory
# ? {$_.distinguishedname -match 'OU=TT People|OU=TTMS People|OU=TTPSC People|OU=TTAS People'}
Get-ADUser -Server 'tt.com.pl'-SearchBase 'OU=SSC Rzeszow,OU=SSC,OU=TT People,OU=TT Users,DC=tt,DC=com,DC=pl' -LDAPFilter '(EmployeeType=*)' -Properties EmployeeType, extensionAttribute1 |
# Select-Object * -First 5 |
ForEach-Object {Set-ADObject -Identity $_.DistinguishedName -Replace @{extensionAttribute1=$($_.EmployeeType)}}