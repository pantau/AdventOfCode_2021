[int[]] $depths = Get-Content -Path ./01_SonarPayload.txt
[int] $increased = 0
[int[]] $depthGroups = $null

for ($i = 2; $i -lt $depths.Count; $i++) {
    $depthGroups += $depths[$i-2] + $depths[$i-1] + $depths[$i]
}

for ($i = 0; $i -lt $depthGroups.Count; $i++) {
    if ($depthGroups[$i-1] -lt $depthGroups[$i]) {
        $increased++
    }
}

Write-Output -InputObject "The depth increased $increased times."
