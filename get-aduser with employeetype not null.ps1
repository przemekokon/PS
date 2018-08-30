# ? {$_.distinguishedname -match 'OU=TT People|OU=TTMS People|OU=TTPSC People|OU=TTAS People'}
# ? {$_.distinguishedname -match 'OU=TTMS People'} |
Get-ADUser -Server 'tt.com.pl'-SearchBase 'OU=SSC Rzeszow,OU=SSC,OU=TT People,OU=TT Users,DC=tt,DC=com,DC=pl' -Properties EmployeeType, Department, Office, extensionAttribute1 -Filter {EmployeeType -like '*'} |
Format-List -Property Name, EmployeeType, Department, Office, extensionAttribute1