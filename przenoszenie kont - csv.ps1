# Lokalizacja docelowa do przeniesienia 
  $TargetOU = "OU=Kosz,DC=tt,DC=com,DC=pl" 
   
 # Import sAMAccountNames z csv 
  Import-Csv "c:\pokon\loginy.csv" | ForEach-Object { 
      # Odczyt lokalizacji usera w AD 
      $UserDN = (Get-ADUser -Identity $_.login).distinguishedName 
   
     # Przeniesienie 
      Move-ADObject -Identity $UserDN -TargetPath $TargetOU 
  } 