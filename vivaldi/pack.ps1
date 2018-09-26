Param(
    # Version # of the build
    [Parameter(Mandatory = $true)]
    [string]
    $version,
    # 32-bit SHA value
    [Parameter(Mandatory = $true)]
    [string]
    $sha32,
    # 64-bit SHA256 value
    [Parameter(Mandatory = $true)]
    [string]
    $sha64,
    # output directory
    [Parameter()]
    [string]
    $outputdirectory = '.\')

$installFile = Get-ChildItem .\tools\chocolateyinstall.ps1

$content = Get-Content $installFile
$content = $content -replace [regex]::Escape('$version$'), $version
$content = $content -replace [regex]::Escape('$32sha$'), $sha32
$content = $content -replace [regex]::Escape('$64sha$'), $sha64

Write-Host $content

Set-Content $installFile.PSPath -Value $content

choco pack --version $version --out $outputdirectory