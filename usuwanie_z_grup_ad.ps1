#import the Active Directory module if not already up and loaded
$module = Get-Module | Where-Object {$_.Name -eq 'ActiveDirectory'}
if ($module -eq $null) {
		Write-Host "Loading Active Directory PowerShell Module"
		Import-Module ActiveDirectory -ErrorAction SilentlyContinue
	}

$employeeSAN = Read-Host "Enter employee login/alias/SamAccountName "
$adServer = "adserver.yourcompany.com"

try{
	Get-ADUser -Identity $employeeSAN -Server $adServer
	#if that doesn't throw you to the catch this person exists. So you can continue

	$ADgroups = Get-ADPrincipalGroupMembership -Identity $employeeSAN | where {$_.Name -ne "Domain Users"}
	if ($ADgroups -ne $null){
		Remove-ADPrincipalGroupMembership -Identity $employeeSAN -MemberOf $ADgroups -Server $adServer -Confirm:$false
	}
}#end try
catch{
	Write-Host "$employeeSAN is not in AD"
}