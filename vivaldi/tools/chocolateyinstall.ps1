$ErrorActionPreference = 'Stop';

$packageName = 'vivaldi'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
 
$packageArgs = @{
    packageName    = $packageName
    FileFullPath   = Join-Path $toolsDir 'vivaldi-downloaded.zip'
 
    url            = 'https://downloads.vivaldi.com/snapshot/Vivaldi.1.13.997.3.exe'
    checksum       = '5379F0D2C2F734C7EA9C1D9F94DA6B621940DD25C5CFE972DD13BE08FA4FCA9D'
    checksumType   = 'sha256' #default is md5, can also be sha1
 
    url64bit       = 'https://downloads.vivaldi.com/snapshot/Vivaldi.1.13.997.3.x64.exe'
    checksum64     = '3D4727D56BEED86407110CAFCD328B7C6EEFE6993231872F7F8E4318602EF3A6'
    checksumType64 = 'sha256' #default is md5, can also be sha1
}
 
$downloadedFile = Get-ChocolateyWebFile @packageArgs
 
Write-Host 'Unpacking vivaldi installer like an archive...'
& 7z x -aoa -bb0 -bso0 -o"$($toolsDir)\$($packageName)" $downloadedFile
Get-ChocolateyUnzip "$($toolsDir)\$($packageName)\vivaldi.7z" "$($toolsDir)\$($packageName)"
 
Write-Host 'Creating *.ignore files to avoid making shims for other exes'
New-Item "$($toolsDir)\$($packageName)\Vivaldi-bin\crash_service.exe.ignore" -type file -force | Out-Null
New-Item "$($toolsDir)\$($packageName)\Vivaldi-bin\wow_helper.exe.ignore" -type file -force | Out-Null
New-Item "$($toolsDir)\$($packageName)\Vivaldi-bin\update_notifier.exe.ignore" -type file -force | Out-Null