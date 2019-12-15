Write-Host "Installing WDK.vsix"

 Get-ChildItem -Recurse "C:\Program Files (x86)\Windows Kits\10\Vsix\"

$process = Start-Process `
    -FilePath "C:\Program Files (x86)\Microsoft Visual Studio\2019\Enterprise\Common7\IDE\VSIXInstaller.exe" `
    -ArgumentList ("/quiet", '"C:\Program Files (x86)\Windows Kits\10\Vsix\WDK.vsix"') `
    -Wait `
    -PassThru
$exitCode = $process.ExitCode
if ($exitCode -eq 0 -or $exitCode -eq 1001) # 1001 means the extension is already installed
{
    Write-Host "WDK.vsix installed successfully"
}
else
{
    Write-Host "Unsuccessful exit code returned by the installation process: $exitCode."
}

exit $exitCode
