﻿$pokon=Get-Credential ttit\pokon
Invoke-Command -ComputerName l1140  -Credential $pokon -ScriptBlock {(Get-ItemProperty "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion").ReleaseId, $env:computername; Write-Output "---------" }