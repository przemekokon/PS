
Add-PSSnapin Microsoft.Exchange.Management.PowerShell.SnapIn
#wyczyszczenie pliku
Clear-Content -Path c:\pokon\smtp\out2.txt 
#sprawdzenie pustych smtp + generowanie txt
Get-Mailbox 3> c:\pokon\smtp\out2.txt -ResultSize Unlimited | Where-Object {$_.PrimarySMTPAddress -eq $null} 
#sprawdzenie czy txt jest pusty
if ((Get-Content -Path c:\pokon\smtp\out2.txt) -ne $null) 
#Wysylka maila
{

$From = 'pokon@tt.com.pl'
$To = 'pokon@promison.com'
$Subject = 'Konta bez adresu SMTP'
$Body = 'Get-Content -Path C:\pokon\smtp\out2.txt -Raw'
$SMTPServer = 'poczta.tt.com.pl'
$SMTPPort = '587'
$Credential = Get-Credential

Send-MailMessage -From $From -To $To -Subject $Subject -Body $Body -SmtpServer $SMTPServer -Port $SMTPPort -Credential $Credential
}
else
{
Exit
}