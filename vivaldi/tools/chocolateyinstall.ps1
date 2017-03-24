$ErrorActionPreference = 'Stop';

$packageName= 'vivaldi'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
 
$packageArgs = @{
  packageName   = $packageName
  FileFullPath  = Join-Path $toolsDir 'vivaldi-downloaded.zip'
 
  url           = 'https://downloads.vivaldi.com/snapshot/Vivaldi.1.8.770.40.exe'
  checksum      = '9D273B003D5EA243E030C28C98F5D1814AB3A96CEAF67BA9BB606522EB2D0F92'
  checksumType  = 'sha256' #default is md5, can also be sha1
 
  url64bit      = 'https://downloads.vivaldi.com/snapshot/Vivaldi.1.8.770.40.x64.exe'
  checksum64    = '6C5C773CC66CB7986E784CBF3BFCBFA8B47F5DFE415D460D20E7680B0EB97BA6'
  checksumType64= 'sha256' #default is md5, can also be sha1
}
 
$downloadedFile = Get-ChocolateyWebFile @packageArgs
 
Write-Host 'Unpacking vivaldi installer like an archive...'
& 7z x -aoa -bb0 -bso0 -o"$($toolsDir)\$($packageName)" $downloadedFile
Get-ChocolateyUnzip "$($toolsDir)\$($packageName)\vivaldi.7z" "$($toolsDir)\$($packageName)"
 
Write-Host 'Creating *.ignore files to avoid making shims for other exes'
New-Item "$($toolsDir)\$($packageName)\Vivaldi-bin\crash_service.exe.ignore" -type file -force | Out-Null
New-Item "$($toolsDir)\$($packageName)\Vivaldi-bin\wow_helper.exe.ignore" -type file -force | Out-Null