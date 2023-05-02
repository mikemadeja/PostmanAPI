function New-PostmanApiWorkspace {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [string]$ApiKey,
        [Parameter(Mandatory)]
        [string]$Name,
        [Parameter(Mandatory)]
        [string]$Type,
        [string]$Description
    )
    $Headers = @{
        "X-Api-Key" = $ApiKey
        "Content-Type" = "application/json"; 
    }

    $NewWorkspaceBody = @{
        "Name" = $Name
        "Type" = $Type; 
    }

    if ($Description) {
        $NewWorkspaceDescriptionBody = @{
            "Description" = $Description
        }

        $NewWorkspaceBody += $NewWorkspaceDescriptionBody
    }

    $NewWorkspaceBody = @{ "workspace" = $NewWorkspaceBody;}

    try {
        #$NewWorkspaceBody
        Invoke-RestMethod -Uri "https://api.getpostman.com/workspaces" -Method Post -Headers $Headers -Body ($NewWorkspaceBody)
    }
    catch {
        throw
    }
}