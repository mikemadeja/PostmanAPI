function Get-PostmanApiAllCollections {
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
        $Output = Invoke-RestMethod -Uri "https://api.getpostman.com/collections" -Method Get -Headers $Headers
        if ($Output) {
            $Output.collections | Select-Object @{label="Name";expression={$_.name}}, @{label="Owner";expression={$_.owner}}, @{label="CreatedAt";expression={$_.createdAt}}, @{label="UpdatedAt";expression={$_.updatedAt}}, @{label="UId";expression={$_.uid}}, @{label="IsPublic";expression={$_.isPublic}}
        }

    }
    catch {
        throw
    }

}

        
    
