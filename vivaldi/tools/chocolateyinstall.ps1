$ErrorActionPreference = 'Stop';

$packageName= 'vivaldi'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
 
$packageArgs = @{
  packageName   = $packageName
  FileFullPath  = Join-Path $toolsDir 'vivaldi-downloaded.zip'
 
  url           = 'https://downloads.vivaldi.com/snapshot/Vivaldi.1.6.689.13.exe'
  checksum      = '17E19FF30E296C41A2CE606F5409DAE4'
  checksumType  = 'md5' #default is md5, can also be sha1
 
  url64bit      = 'https://downloads.vivaldi.com/snapshot/Vivaldi.1.6.689.13.x64.exe'
  checksum64    = '2FAB563843323AFA49B3EE56C7745888'
  checksumType64= 'md5' #default is checksumType
}
 
$downloadedFile = Get-ChocolateyWebFile @packageArgs
 
Write-Host 'Unpacking vivaldi installer like an archive...'
& 7z x -aoa -bb0 -bso0 -o"$($toolsDir)\$($packageName)" $downloadedFile
Get-ChocolateyUnzip "$($toolsDir)\$($packageName)\vivaldi.7z" "$($toolsDir)\$($packageName)"
 
Write-Host 'Creating *.ignore files to avoid making shims for other exes'
New-Item "$($toolsDir)\$($packageName)\Vivaldi-bin\crash_service.exe.ignore" -type file -force | Out-Null
New-Item "$($toolsDir)\$($packageName)\Vivaldi-bin\wow_helper.exe.ignore" -type file -force | Out-Null