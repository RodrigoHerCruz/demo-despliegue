param(
    [string]$RutaPHP = 'PHP',
    [switch]$NoIniciarServidor
)

$archivoOrigen = Join-Path $PSScriptRoot 'origen\index.php'
$archivoDestino = Join-Path $PSScriptRoot 'pruebas\index.php'

& $RutaPHP -l $archivoOrigen

if ($LASTEXITCODE -ne 0) {
    throw "PHP reporto un error de sintaxis; publicacion cancelada."
}

Copy-Item $archivoOrigen $archivoDestino -Force -ErrorAction Stop
Write-Host "Version publicada en el ambiente de pruebas."

if (-not $NoIniciarServidor) {
    & $RutaPHP -S localhost:8000 -t (Join-Path $PSScriptRoot 'pruebas')
}
# ps indica que se ejecutara desde la terminal
