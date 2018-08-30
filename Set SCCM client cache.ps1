$a=([wmi]"ROOT\ccm\SoftMgmtAgent:CacheConfig.ConfigKey='Cache'")
$a.Size=8500;$a.Put()
Stop-Service -Name ccmexec
Start-Service -Name ccmexec
			