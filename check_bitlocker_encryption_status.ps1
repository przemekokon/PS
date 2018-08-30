<#
Skrypt sprawadzajacy w losowych laptopach stan szyfrowania
Przemek Okon
pokon@promison.com
#>

#Pobranie komputerow z AD, losowanie i zapis do zmiennej

$cn= Get-ADComputer -Filter 'name -like "L*"' -SearchBase "OU=TT Computers,DC=tt,DC=com,DC=pl" -Server tt.com.pl -Properties name | Sort-Object{get-random} | select -First 10 | ft name

#Ping komputerow, jesli komputer odpowiada skrypt leci dalej

#$online= Test-Connection -ComputerName $cn -Count 2 -BufferSize 16 -Quiet
    foreach ($computer in $cn)
    #if ($online -eq $true)
    
    {
    
    #komputer jest dostepny i sprawdzamy status szyfrowania
    Invoke-Command -ComputerName $lista -Credential ttit\pokon -ScriptBlock {gip}}
    
    }
    
    else

    {

    #komputer offline
    Write-Host "Komputer $cn niedostepny" -ForegroundColor white -BackgroundColor Red
        
    }

