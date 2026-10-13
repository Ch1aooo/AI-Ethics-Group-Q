param(
    [ValidateSet('All','Phase1','Phase2')]
    [string]$Document = 'All'
)
$ErrorActionPreference = 'Stop'
$taskWorkspace = [IO.Path]::GetFullPath((Join-Path $PSScriptRoot '..'))
Set-Location -LiteralPath $taskWorkspace
$taskOutput = Join-Path $taskWorkspace 'output\pdf'
New-Item -ItemType Directory -Force -Path $taskOutput | Out-Null
$documentsToBuild = if ($Document -eq 'All') { @('Phase1','Phase2') } else { @($Document) }
foreach ($documentToBuild in $documentsToBuild) {
    foreach ($compilePass in 1..3) {
        & pdflatex -interaction=nonstopmode -halt-on-error "-output-directory=$taskOutput" "$documentToBuild.tex" | Out-Null
        if ($LASTEXITCODE -ne 0) {
            throw "Compile failed for $documentToBuild.tex. See output/pdf/$documentToBuild.log."
        }
    }
    Write-Output "Built output/pdf/$documentToBuild.pdf"
}
