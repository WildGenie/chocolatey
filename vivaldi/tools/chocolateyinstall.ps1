$ErrorActionPreference = 'Stop';

$packageName = 'vivaldi'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
 
$packageArgs = @{
    packageName    = $packageName
    FileFullPath   = Join-Path $toolsDir 'vivaldi-downloaded.zip'
 
    url            = 'https://downloads.vivaldi.com/snapshot/Vivaldi.1.11.904.3.exe'
    checksum       = '0EF859C1561537A965B5DD8912AEB76E87017E925D11EA50E99591610F098A03'
    checksumType   = 'sha256' #default is md5, can also be sha1
 
    url64bit       = 'https://downloads.vivaldi.com/snapshot/Vivaldi.1.11.904.3.x64.exe'
    checksum64     = '75F42166877FC91EA1F5DE38443C5B09DDA8DDC0DD9FA4D788B169F9FF56C315'
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