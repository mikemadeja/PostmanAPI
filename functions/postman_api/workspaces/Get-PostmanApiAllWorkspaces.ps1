function Get-PostmanApiAllWorkspaces {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [string]$ApiKey
    )
    $Headers = @{
        "X-Api-Key" = $ApiKey
        "Content-Type" = "application/json"; 
    }

    try {
        $Output = Invoke-RestMethod -Uri "https://api.getpostman.com/workspaces" -Method Get -Headers $Headers
        if ($Output) {
            $Output.workspaces | Select-Object @{label="Name";expression={$_.name}}, @{label="Type";expression={$_.type}}, @{label="Visibility";expression={$_.visibility}}, @{label="Id";expression={$_.id}}
        }
    }
    catch {
        throw
    }
}