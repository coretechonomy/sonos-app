#Sonos Controller

$packageName	= 'sonos-app'
$packageSearch  = 'Sonos Controller'
$installerType	= 'exe'
$url			= '${DOWNLOAD_URL}'
$url64          = $url
$silentArgs		= '/s /v"/qn"'
$validExitCodes	= @(0,3010)

$app = Get-ItemProperty -Path @('HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*',
                                'HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*') `
		-ErrorAction:SilentlyContinue | Where-Object { $_.DisplayName -like $packageSearch }

Install-ChocolateyPackage $packageName $installerType $silentArgs $url $url64 `
    -validExitCodes $validExitCodes 
