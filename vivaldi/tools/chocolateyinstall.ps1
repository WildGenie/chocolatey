$ErrorActionPreference = 'Stop';

$packageName= 'vivaldi'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
 
$packageArgs = @{
  packageName   = $packageName
  FileFullPath  = Join-Path $toolsDir 'vivaldi-downloaded.zip'
 
  url           = 'https://downloads.vivaldi.com/snapshot/Vivaldi.1.10.834.9.exe'
  checksum      = 'CF9363E7E3BED7ECB7D23E32661C054458B4B0F95D5B2D2AD64CE08502E3F642'
  checksumType  = 'sha256' #default is md5, can also be sha1
 
  url64bit      = 'https://downloads.vivaldi.com/snapshot/Vivaldi.1.10.834.9.x64.exe'
  checksum64    = '070DDD5F884951E7271353A1A5C58FC208B56E9852B59875223E01EA4B6449CC'
  checksumType64= 'sha256' #default is md5, can also be sha1
}
 
$downloadedFile = Get-ChocolateyWebFile @packageArgs
 
Write-Host 'Unpacking vivaldi installer like an archive...'
& 7z x -aoa -bb0 -bso0 -o"$($toolsDir)\$($packageName)" $downloadedFile
Get-ChocolateyUnzip "$($toolsDir)\$($packageName)\vivaldi.7z" "$($toolsDir)\$($packageName)"
 
Write-Host 'Creating *.ignore files to avoid making shims for other exes'
New-Item "$($toolsDir)\$($packageName)\Vivaldi-bin\crash_service.exe.ignore" -type file -force | Out-Null
New-Item "$($toolsDir)\$($packageName)\Vivaldi-bin\wow_helper.exe.ignore" -type file -force | Out-Null
New-Item "$($toolsDir)\$($packageName)\Vivaldi-bin\update_notifier.exe.ignore" -type file -force | Out-Null