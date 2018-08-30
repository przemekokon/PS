#$Username = 'ttit\listvm'
#$Password = ''
#$pass = ConvertTo-SecureString -AsPlainText $Password -Force
#$SecureString = $pass
# Users you password securly
#$MySecureCreds = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $Username,$SecureString

#---

$import_pass = Get-Content C:\skrypt\importvm\pass2.txt | ConvertTo-SecureString
$cred = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList 'ttit\listvm',$import_pass

$Header = @"
<style>
<br>
<br>
TABLE {border-width: 1px; border-style: solid; border-color: black; border-collapse: collapse;}
TD {border-width: 1px; padding: 3px; border-style: solid; border-color: black;}
</style>
"@
$global:i=0
$waw = { import-module VirtualMachineManager; get-vm -VMMServer gungnir.tt.com.pl  |  select @{Name="Item#";Expression={$global:i++;$global:i}},Name,VirtualMachineState,Hostname,OperatingSystem,IsHighlyAvailable,IsRecoveryVM,IsPrimaryVM}
$lista = Invoke-Command -ComputerName gungnir.tt.com.pl -ScriptBlock $waw -Credential $cred
$lista | ConvertTo-Html -Head $Header > C:\listavm\waw.html
import-module VirtualMachineManager
$ldz = get-vm -VMMServer vmm2012r2.tt.com.pl | select @{Name="Item#";Expression={$global:i++;$global:i}},Name,VirtualMachineState,Hostname,OperatingSystem,IsHighlyAvailable,IsRecoveryVM,IsPrimaryVM
$ldz | ConvertTo-Html -Head $Header >  C:\listavm\ldz.html