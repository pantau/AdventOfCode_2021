<#
    .SYNOPSIS
    AdventOfCode 2021 Day 03 part 2

    .DESCRIPTION
    The submarine has been making some odd creaking noises, so you ask it to produce a diagnostic report just in case.

    .PARAMETER payloadFilePath
    Specifies the path to the plain text input file.

    .INPUTS
    None. You cannot pipe objects to 02_BinaryDiagnostic.ps1

    .OUTPUTS
    The solution is returned as [int]

    .EXAMPLE
    PS> .\02_BinaryDiagnostic.ps1
#>

[CmdletBinding()]
param (
    [Parameter()] [System.IO.FileInfo] $payloadFilePath = "./01_BinaryDiagnostic.txt"
)

Begin {
    [string[]] $diagnostics = Get-Content -Path $payloadFilePath
    [int[]] $gammaRate = 0,0,0,0,0,0,0,0,0,0,0,0
    [int[]] $epsilonRate = 0,0,0,0,0,0,0,0,0,0,0,0
}

Process {
    0..11 | ForEach-Object {
        [int] $positiveValues = 0
        [int] $currentDigit = $_

        $diagnostics | ForEach-Object {
            $positiveValues += [int]::Parse($_.Substring($currentDigit,1))
        }

        if ($positiveValues -gt $diagnostics.Length / 2) {
            $gammaRate[$currentDigit] = 1
            $epsilonRate[$currentDigit] = 0
        }
        else {
            $gammaRate[$currentDigit] = 0
            $epsilonRate[$currentDigit] = 1
        }
    }
}

End {
    [string] $gammaRateBin = "$gammaRate" -replace '\s+', ''
    [string] $epsilonRateBin = "$epsilonRate" -replace '\s+', ''

    [int] $gammaRateDec = [convert]::ToInt32($gammaRateBin,2)
    [int] $epsilonRateDec = [convert]::ToInt32($epsilonRateBin,2)

    Write-Output -InputObject ($gammaRateDec * $epsilonRateDec)
}
