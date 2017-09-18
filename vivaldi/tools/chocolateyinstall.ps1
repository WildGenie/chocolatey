$ErrorActionPreference = 'Stop';

$packageName = 'vivaldi'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
 
$packageArgs = @{
    packageName    = $packageName
    FileFullPath   = Join-Path $toolsDir 'vivaldi-downloaded.zip'
 
    url            = 'https://downloads.vivaldi.com/snapshot/Vivaldi.1.12.955.20.exe'
    checksum       = 'A26E5C3CDE42CD4E3FAA27279FAE938A588724D85C83A5839D92066136BE7C3C'
    checksumType   = 'sha256' #default is md5, can also be sha1
 
    url64bit       = 'https://downloads.vivaldi.com/snapshot/Vivaldi.1.12.955.20.x64.exe'
    checksum64     = '5189AFFA994FA55335FB35E389D7F3E12B6B962F4B39E6D0F36153FA02F348F6'
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