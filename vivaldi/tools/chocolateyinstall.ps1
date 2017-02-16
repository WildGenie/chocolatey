$ErrorActionPreference = 'Stop';

$packageName= 'vivaldi'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
 
$packageArgs = @{
  packageName   = $packageName
  FileFullPath  = Join-Path $toolsDir 'vivaldi-downloaded.zip'
 
  url           = 'https://downloads.vivaldi.com/snapshot/Vivaldi.1.7.735.39.exe'
  checksum      = 'F77708190A9F03635D11488F4E4E7B2CEDD595000D442657173974C6D31F7F79'
  checksumType  = 'sha256' #default is md5, can also be sha1
 
  url64bit      = 'https://downloads.vivaldi.com/snapshot/Vivaldi.1.7.735.39.x64.exe'
  checksum64    = 'D78FD095107529F293C0C99DCB7B7CCF101699A3CA935C81F888ED28A64DBD5D'
  checksumType64= 'sha256' #default is md5, can also be sha1
}
 
$downloadedFile = Get-ChocolateyWebFile @packageArgs
 
Write-Host 'Unpacking vivaldi installer like an archive...'
& 7z x -aoa -bb0 -bso0 -o"$($toolsDir)\$($packageName)" $downloadedFile
Get-ChocolateyUnzip "$($toolsDir)\$($packageName)\vivaldi.7z" "$($toolsDir)\$($packageName)"
 
Write-Host 'Creating *.ignore files to avoid making shims for other exes'
New-Item "$($toolsDir)\$($packageName)\Vivaldi-bin\crash_service.exe.ignore" -type file -force | Out-Null
New-Item "$($toolsDir)\$($packageName)\Vivaldi-bin\wow_helper.exe.ignore" -type file -force | Out-Null