﻿
$ErrorActionPreference = 'Stop';


$packageName= 'TrayStatus.Install'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://binaryfortressdownloads.com/Download/BFSFiles/114/TrayStatusSetup-4.0.exe'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = $url

  validExitCodes= @(0, 3010, 1641)
  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'

  softwareName  = 'TrayStatus.Install*'
  checksum      = 'BA8997B50CDD88E9D27A3CB3AB84D7F292006BE66494A987FD202BEACE1EF4B2'
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs