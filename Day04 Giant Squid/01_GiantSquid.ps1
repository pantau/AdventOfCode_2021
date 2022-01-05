<#
    .SYNOPSIS
    AdventOfCode 2021 Day 04 part 1

    .DESCRIPTION
    We're going to play Bingo (with / against a giant squid)

    .PARAMETER drawFilePath
    Specifies the path to the plain text input file which contains the Bingo tables.

    .INPUTS
    None. You cannot pipe objects to 01_GiantSquid.ps1

    .OUTPUTS
    The solution is returned as [int]

    .EXAMPLE
    PS> 01_GiantSquid.ps1
#>

[CmdletBinding()]
param (
    [Parameter()] [System.IO.FileInfo] $tablesFilePath = "01_GiantSquidTables.txt"
)

Begin {
    [int[]] $draws = 37,60,87,13,34,72,45,49,61,27,97,88,50,30,76,40,63,9,38,67,82,6,59,90,99,54,11,66,98,23,64,14,18,4,10,89,46,32,19,5,1,53,25,96,2,12,86,58,41,68,95,8,7,3,85,70,35,55,77,44,36,51,15,52,56,57,91,16,71,92,84,17,33,29,47,75,80,39,83,74,73,65,78,69,21,42,31,93,22,62,24,48,81,0,26,43,20,28,94,79
    $tableContent = Get-Content -Path $tablesFilePath
    [array[]] $tables = @()
}

Process {
    $bingoTable = New-Object -TypeName 'int[,]' 1,5

    $tableContent | ForEach-Object {
        if (-not [string]::IsNullOrEmpty($_)) {
            $row = $_
            0..4 | ForEach-Object {
                $bingoTable[0,$_] = [int]::Parse($row.Substring(0,2))
                $bingoTable[0,$_] = [int]::Parse($row.Substring(3,2))
                $bingoTable[0,$_] = [int]::Parse($row.Substring(6,2))
                $bingoTable[0,$_] = [int]::Parse($row.Substring(9,2))
                $bingoTable[0,$_] = [int]::Parse($row.Substring(12,2))
            }
            $bingoTable
        }
    }

    #$bingoTable[0,0] = 1
    #$tables += $bingoTable
    #$tables[1].GetType()
}

End {
}
