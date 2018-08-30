$cred = Get-Credential ttit\pokon
$comp = 'l0153'
if (Test-Connection -ComputerName $comp -Quiet)
{Invoke-Command -ComputerName $comp -ScriptBlock { (Get-ItemProperty "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion").ReleaseId} -Credential $cred}
else
{'Nie pinga'}