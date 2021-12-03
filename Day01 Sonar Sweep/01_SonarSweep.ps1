<#
    .SYNOPSIS
    AdventOfCode 2021 Day 01 part 1

    .DESCRIPTION
    We're trying to figure out how often the depth increases.

    .PARAMETER payloadFilePath
    Specifies the path to the plain text input file.

    .INPUTS
    None. You cannot pipe objects to 01_SonarEvaluator.ps1

    .OUTPUTS
    The solution is returned as [int]

    .EXAMPLE
    PS> .\01_SonarEvaluator.ps1
#>

[CmdletBinding()]
param (
    [Parameter()] [System.IO.FileInfo] $payloadFilePath = "01_SonarSweep.txt"
)

Begin {
    [int[]] $depths = Get-Content -Path $payloadFilePath
    [int] $increased = 0
}

Process {
    for ($i = 1; $i -lt $depths.Count; $i++) {
        if ($depths[$i-1] -lt $depths[$i]) {
            $increased++
        }
    }
}

End {
    Write-Output -InputObject $increased
}
