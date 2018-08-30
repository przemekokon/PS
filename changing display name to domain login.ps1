$names = Import-CSV c:\pokon\Zeszyt3.csv -Header Givenname,Surname -Delimiter ";"
ForEach ($Name in $Names)
{
    $FirstFilter = $Name.Givenname
    $SecondFilter = $Name.Surname
    Get-ADUser -Filter { GivenName -like $FirstFilter -and Surname -like $SecondFilter} |select samaccountname 
    
} 
#$test | Export-Csv c:\pokon\test666.csv -NoTypeInformation