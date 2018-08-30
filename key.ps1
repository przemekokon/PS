
$Productkey = (Get-WmiObject -Class SoftwareLicensingService).OA3xOriginalProductkey
slmgr.vbs -ipk $Productkey /s