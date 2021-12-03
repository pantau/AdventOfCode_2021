<#
    .SYNOPSIS
    AdventOfCode 2021 Day 02 part 2

    .DESCRIPTION
    We're trying to figure out where the submarine is based on the steering commands provided, now a third parameter "aim" is added.
    The result is the calculated horizontal position multiplied with the depth.

    .PARAMETER InputPath
    Specifies the path to the plain text input file.

    .INPUTS
    None. You cannot pipe objects to 02_Dive.ps1

    .OUTPUTS
    The solution is returned as [int]

    .EXAMPLE
    PS> .\02_Dive.ps1
#>

[CmdletBinding()]
param (
    [Parameter()] [System.IO.FileInfo] $payloadFilePath = "./01_Dive.txt"
)

Begin {
    [string[]] $steerings = Get-Content $payloadFilePath
    [int] $horizontal = 0
    [int] $depth = 0
    [int] $aim = 0
}

Process {
    $steerings | ForEach-Object {
        [array] $steeringInstruction = $_.Split(" ")
        switch ($steeringInstruction[0]) {
            forward {
                $horizontal += $steeringInstruction[1]
                $depth += [int]::Parse($steeringInstruction[1]) * $aim
            }
            down {
                $aim += $steeringInstruction[1]
            }
            up {
                $aim -= $steeringInstruction[1]
            }
        }
    }
}

End {
    Write-Output -InputObject ($horizontal * $depth)
}
