$ErrorActionPreference = 'Stop';

$packageName = 'vivaldi'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
 
$packageArgs = @{
    packageName    = $packageName
    FileFullPath   = Join-Path $toolsDir 'vivaldi-downloaded.zip'
 
    url            = 'https://downloads.vivaldi.com/snapshot/Vivaldi.1.13.1008.3.exe' # NEXT TIME DO SILENT INSTALL SETUP!!!!!
    checksum       = 'A62C5731B4100FE88E397F88C8B26F71FF4FB6D0E8961DD5C4D47443AD53688B'
    checksumType   = 'sha256' #default is md5, can also be sha1
 
    url64bit       = 'https://downloads.vivaldi.com/snapshot/Vivaldi.1.13.1008.3.x64.exe'
    checksum64     = '4002667A70238316F2D5268D4EBB9714EB1CDC1803CD7225F3AD604ADE241656'
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