$ErrorActionPreference = 'Stop'
Set-Location -LiteralPath $PSScriptRoot
# TeXcount needs Perl; Git for Windows supplies it on this computer.
if (-not (Get-Command perl -ErrorAction SilentlyContinue)) {
    if (Test-Path -LiteralPath 'C:\Program Files\Git\usr\bin\perl.exe') {
        $env:PATH = 'C:\Program Files\Git\usr\bin;' + $env:PATH
    }
}
$countSource = Get-Content -LiteralPath 'chapters\phase1-body.tex' -Raw
# Count narrative prose only: exclude tables, diagrams, headings, TODOs and references.
$countSource = [regex]::Replace($countSource, '(?s)\\begin\{(table\*?|figure\*?|longtable)\}.*?\\end\{\1\}', '')
$countSource = [regex]::Replace($countSource, '\\(?:section|subsection|subsubsection|placeholder|input|nocite)\*?\{[^{}]*\}', '')
$countSource = [regex]::Replace($countSource, '(?m)^\\textbf\{[^{}]*\}', '')
$countSource = "%TC:macro placeholder [ignore]`n" + $countSource
[IO.File]::WriteAllText((Join-Path $PSScriptRoot 'wordcount-body.tmp.tex'), $countSource)
$countOutput = & texcount '-sum=1,0,0,0,0,0,0' -1 'wordcount-body.tmp.tex'
if ($LASTEXITCODE -ne 0) { throw 'TeXcount failed.' }
$bodyCount = ($countOutput | Where-Object { $_ -match '^\s*\d+\s*$' } | Select-Object -Last 1).Trim()
if ($bodyCount -notmatch '^\d+$') { throw 'Unexpected TeXcount output.' }
[IO.File]::WriteAllText((Join-Path $PSScriptRoot 'wordcount.tex'), "\newcommand{\mainwordcount}{$bodyCount}`n")
Remove-Item -LiteralPath (Join-Path $PSScriptRoot 'wordcount-body.tmp.tex')
Write-Output "Main-text word count: $bodyCount (TeXcount; excludes headings, tables, figures, TODOs, references and appendices)."
$reportOutputDirectory = [IO.Path]::GetFullPath((Join-Path $PSScriptRoot '..\output\pdf'))
New-Item -ItemType Directory -Force -Path $reportOutputDirectory | Out-Null
$reportJobName = 'Group-Q-Phase1-Retained'
foreach ($stage in 1..4) {
    if ($stage -eq 2) { & bibtex (Join-Path $reportOutputDirectory $reportJobName) | Out-Null }
    else { & pdflatex -interaction=nonstopmode -halt-on-error "-output-directory=$reportOutputDirectory" "-jobname=$reportJobName" phase1-report.tex | Out-Null }
    if ($LASTEXITCODE -ne 0) { throw "Build failed at stage $stage; see the LaTeX log." }
}
Write-Output 'Built output/pdf/Group-Q-Phase1-Retained.pdf (retained Phase 1 only).'
