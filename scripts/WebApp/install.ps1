New-Item c:\jj.txt -Force

.\JJWebsite.ps1

Start-DscConfiguration -Wait -Force -Path .\JJWebsite\