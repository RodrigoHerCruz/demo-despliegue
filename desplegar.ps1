param(
    [string]$RutaPHP = 'PHP'
)

$archivoOrigen = Join-Path $PSScriptRoot 'origen\index.php'
$archivoDestino = Join-Path $PSScriptRoot 'pruebas\index.php'

& $RutaPHP -l $archivoOrigen

if ($LASTEXITCODE  -ne 0) {
    Write-Host "Hay un error de sintaxis. No se público el cambio."
}
Copy-Item $archivoOrigen $archivoDestino -Force -ErrorAction Stop
Write-Host "Versión publicada en el ambiente de pruebas."
& 'C:\laragon\bin\php\php-8.3.30-Win32-vs16-x64\php.exe' -S localhost:8000 -t .\pruebas
#  ps indica que se ejecutara desde la terminal 