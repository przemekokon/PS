Import-Module activedirectory
get-aduser -Filter * -Server 'tt.com.pl' -SearchBase 'OU=TTMS People,OU=TTMS Users,OU=TTMS,DC=tt,DC=com,DC=pl'-Properties name, samaccountname, office, mail, title |
select name, samaccountname, office, mail, title | Format-Table | Out-File C:\temp\ttms.txt