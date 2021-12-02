[int[]] $depths = Get-Content -Path ./01_SonarPayload.txt
[int] $increased = 0

for ($i = 1; $i -lt $depths.Count; $i++) {
    if ($depths[$i-1] -lt $depths[$i]) {
        $increased++
    }
}

Write-Output -InputObject $increased