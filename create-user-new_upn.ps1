﻿Import-Module ActiveDirectory 
Import-Csv C:\loginy.csv | $domain=tt.com.pl | $upn=$_.login + $domain | ForEach-Object {New-ADUser -Name $_.login -DisplayName $_.login  -UserPrincipalName $upn -AccountPassword (ConvertTo-SecureString $_.password -AsPlainText -Force) -PasswordNeverExpires $true -Path "OU=ludzie,DC=pszemo,DC=local"  -Enabled $true  -ChangePasswordAtLogon $false }