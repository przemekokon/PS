Import-Module ActiveDirectory

Function MAIN()

{
 	
Copy-Item -Path \\savo\Users$\Users.csv -Destination 'C:\Scripts\KiPdoAD'


if ( (Test-Path "C:\Scripts\KiPdoAD\Users.csv") -ne $False) 
	
     {   
	$UserFilePath = "C:\Scripts\KiPdoAD\Users.csv"
	$line_number=(Get-Content $UserFilePath | Measure-Object)
        $ln=$line_number.count
        $header="lp","nazwisko","imie","dimie","biuro","dzial","ndzial","dz","dzlogin","do","dologin","ko","kologin","rodzajwspolpracy","stanowisko","paszport","paszportdata","telsluz","telkom","id","idteta","telwew","nrewid","firma","specjalny","datazatr","KF","login"        
        
	if ( $ln -gt 0 )
        {
       	 	$users= Import-CSV -Delimiter ";" $UserFilePath -header $header
               
		ForEach ($user in $users) 
		{
     			$bossid=$null
			$surname=$user.nazwisko
                        $name=$user.imie
                        $office=$user.biuro
			$department=$user.dzial
			$workdeal=$user.rodzajwspolpracy
			$title=$user.stanowisko
			$officephone=$user.telsluz
			$mobilephone=$user.telkom
			$employeeid=$user.id
                        $koperacyjny=$user.kologin
                        $doperacyjny=$user.dologin
			$dzarzadzajacy=$user.dzlogin
			$departmentnum=$user.ndzial
			$internalphone=$user.telwew
                        $login=$user.login
                        $comp=$user.firma
                        $employeetype=$user.rodzajwspolpracy
                        

                        if ( $koperacyjny )      { $bossid=$koperacyjny }
                        elseif ( $doperacyjny )  { $bossid=$doperacyjny }
			elseif ( $dzarzadzajacy ){ $bossid=$dzarzadzajacy }
                        else { $bossid=$null }

			if ( $office -eq "Ostrów Wlkp." ) {$office = "Ostrów wielkopolski"}

               
	        $user=Get-ADuser -Identity $login

		if ( $bossid -eq $null ) {$manager=$null }
                else {	$manager=Get-ADuser -Identity $bossid }


		Set-ADUser -Identity $user -Server DC-Waw.tt.com.pl -Office $office -Country "PL"  -Department $department -Manager $manager -Company "Transition Technologies S.A." -Replace @{co="Poland";countrycode="616";employeetype=$employeetype}
		
		# Jesli Tel. wew jest wpisana w KiP to zastap istniejaca wartość pola otherTelephone ta wartoscia ale jesli jest pusta w KiP to wyczyść wartość otherTelephone w AD.

		if ( $internalphone ) { Set-ADUser -Identity $user -Server DC-Waw.tt.com.pl -Replace @{otherTelephone=$internalphone} }
                else { Set-ADUser -Identity $user -Server DC-Waw.tt.com.pl -Clear otherTelephone }

		if ( $officephone ) { Set-ADUser -Identity $user -Server DC-Waw.tt.com.pl -OfficePhone $officephone }
		if ( $mobilephone ) { Set-ADUser -Identity $user -Server DC-Waw.tt.com.pl -MobilePhone $mobilephone }
                if ( $workdeal -eq "Etat" ){ Set-ADUser -Identity $user -Server DC-Waw.tt.com.pl -Title $title}
		
		if ( $office -eq "Białystok" )           {Set-ADUser -Identity $user -Server DC-Waw.tt.com.pl   -StreetAddress "Sienkiewicza 82" -City "Białystok" -PostalCode "15-005" -State "podlaskie" }
		if ( $office -eq "Łódź" )                {Set-ADUser -Identity $user -Server DC-Waw.tt.com.pl   -StreetAddress "Piotrkowska 276" -City "Łódź" -PostalCode "90-361" -State "łódzkie" }
		if ( $office -eq "Lublin" )              {Set-ADUser -Identity $user -Server DC-Waw.tt.com.pl   -StreetAddress "Jana Pawła II 17" -City "Lublin" -PostalCode "20-538" -State "lubelskie" }
		if ( $office -eq "Ostrów wielkopolski" ) {Set-ADUser -Identity $user -Server DC-Waw.tt.com.pl   -StreetAddress "Staroprzygodzka 117" -City "Ostrów Wlkp." -PostalCode "63-400" -State "wielkopolskie" }
		if ( $office -eq "Warszawa" )            {Set-ADUser -Identity $user -Server DC-Waw.tt.com.pl   -StreetAddress "Pawia 55" -City "Warszawa" -PostalCode "01-030" -State "mazowieckie" }
		if ( $office -eq "Wrocław" )             {Set-ADUser -Identity $user -Server DC-Waw.tt.com.pl   -StreetAddress "Antoniego Słonimskiego " -City "Wrocław" -PostalCode "50-304" -State "dolnośląskie" }
		if ( $office -eq "Kielce" )           	 {Set-ADUser -Identity $user -Server DC-Waw.tt.com.pl   -StreetAddress "Karola Olszewskiego 6" -City "Kielce" -PostalCode "25-663" -State "świętokrzyskie" }
                if ( $office -eq "Koszalin" )            {Set-ADUser -Identity $user -Server DC-Waw.tt.com.pl   -StreetAddress "Szczecińska 25a" -City "Koszalin" -PostalCode "75-218" -State "zachodniopomorskie" } 
                if ( $office -eq "Kraków" )              {Set-ADUser -Identity $user -Server DC-Waw.tt.com.pl   -StreetAddress "Podole 60" -City "Kraków" -PostalCode "30-394" -State "małopolskie" } 
                if ( $office -eq "Olsztyn" )             {Set-ADUser -Identity $user -Server DC-Waw.tt.com.pl   -StreetAddress "Bartosza Głowackiego 14" -City "Olsztyn" -PostalCode "10-448" -State "warmińsko-mazurskie" }
                if ( $office -eq "Rzeszów" )             {Set-ADUser -Identity $user -Server DC-Waw.tt.com.pl   -StreetAddress "Tadeusza Rejtana 8" -City "Rzeszów" -PostalCode "35-310" -State "podkarpackie" }
                if ( $office -eq "Zielona Góra" )        {Set-ADUser -Identity $user -Server DC-Waw.tt.com.pl   -StreetAddress "Bohaterów Westerplatte 45" -City "Zielona Góra" -PostalCode "65-078" -State "lubuskie" } 
		
		}
  
    	}
      }	
   
 
#Remove-item "C:\Scripts\KiPdoAD\Users.csv"

 
}
MAIN