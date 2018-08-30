$computers= Get-ADComputer -Filter 'name -like "L*"' -SearchBase "OU=TT Computers,DC=tt,DC=com,DC=pl" -Server tt.com.pl -Properties name | Sort-Object{get-random} | select -First 5 | ft name
  
  foreach ($computer in $computers)
  
  {

  
  if (Test-Connection -ComputerName $computer -Count 1 -Quiet)
   {

   Invoke-Command -Credential ttit\pokon -ScriptBlock {gip}

   } 

   }