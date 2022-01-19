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
    [Parameter()] [System.IO.FileInfo] $payloadFilePath = "01_BinaryDiagnostic.txt"
)

Begin {
    [string[]] $oxygenBitCriteria = $co2ScrubberBitCriteria = Get-Content -Path $payloadFilePath

    function Get-BitCriteria {
        param (
            [Parameter()] [string[]] $array,
            [Parameter()] [int] $column
        )

        [int] $positiveValues = 0

        $array | ForEach-Object {
            $positiveValues += [int]::Parse($_.Substring($column,1))

            if ($positiveValues -ge $array.Length / 2) {
                $oxygenBitCriteria = $oxygenBitCriteria | Where-Object {
                    $_.Substring($currentDigit,1) -eq "1"
                }
            }
        }
    }
}

Process {
    0..11 | ForEach-Object {
        
        [int] $currentDigit = $_

        $oxygenBitCriteria | ForEach-Object {
            $positiveValues += [int]::Parse($_.Substring($currentDigit,1))

            if ($positiveValues -ge $oxygenBitCriteria.Length / 2) {
                $oxygenBitCriteria = $oxygenBitCriteria | Where-Object {
                    $_.Substring($currentDigit,1) -eq "1"
                }
            }
        }

        $co2ScrubberBitCriteria | ForEach-Object {
            $positiveValues += [int]::Parse($_.Substring($currentDigit,1))

            if ($positiveValues -le $co2ScrubberBitCriteria.Length / 2) {
                $oxygenBitCriteria = $oxygenBitCriteria | Where-Object {
                    $_.Substring($currentDigit,1) -eq "0"
                }
            }
        }
    }
}

End {
<#     [string] $gammaRateBin = "$gammaRate" -replace '\s+', ''
    [string] $epsilonRateBin = "$epsilonRate" -replace '\s+', ''

    [int] $gammaRateDec = [convert]::ToInt32($gammaRateBin,2)
    [int] $epsilonRateDec = [convert]::ToInt32($epsilonRateBin,2) #>

    #$oxygenGeneratorSet
    #$co2ScrubberSet

    #Write-Output -InputObject ($gammaRateDec * $epsilonRateDec)
}
