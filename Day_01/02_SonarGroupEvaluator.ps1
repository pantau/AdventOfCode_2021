<#
    .SYNOPSIS
    AdventOfCode 2021 Day 01 part 2

    .DESCRIPTION
    We're trying to figure out how often the depth increases accumulating measurements of three depths.

    .PARAMETER payloadFilePath
    Specifies the path to the plain text input file.

    .INPUTS
    None. You cannot pipe objects to 02_SonarGroupEvaluator.ps1

    .OUTPUTS
    The solution is returned as [int]

    .EXAMPLE
    PS> .\02_SonarGroupEvaluator.ps1
#>

[CmdletBinding()]
param (
    [Parameter()] [System.IO.FileInfo] $payloadFilePath = "01_SonarPayload.txt"
)

Begin {
    [int[]] $depths = Get-Content -Path $payloadFilePath
    [int] $increased = 0
    [int[]] $depthGroups = $null
}

Process {
    for ($i = 2; $i -lt $depths.Count; $i++) {
        $depthGroups += $depths[$i-2] + $depths[$i-1] + $depths[$i]
    }
    
    for ($i = 0; $i -lt $depthGroups.Count; $i++) {
        if ($depthGroups[$i-1] -lt $depthGroups[$i]) {
            $increased++
        }
    }
}

End {
    Write-Output -InputObject $increased
}
