function Get-PostmanApiCollection {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [string]$ApiKey,
        [parameter(Mandatory=$true,
        ParameterSetName="WithCollectionId")]
        [String]
        $CollectionId,
        [parameter(Mandatory=$true,
        ParameterSetName="WithName")]
        [String]
        $Name
    )

#NOT DONE

    $Headers = @{
        "X-Api-Key" = $ApiKey
        "Content-Type" = "application/json"; 
    }



    try {
        
        
        if ($Name) {
            $Output = Invoke-RestMethod -Uri "https://api.getpostman.com/collections" -Method Get -Headers $Headers
            $Output = $Output.collections | Select-Object @{label="Name";expression={$_.name}}, @{label="Owner";expression={$_.owner}}, @{label="CreatedAt";expression={$_.createdAt}}, @{label="UpdatedAt";expression={$_.updatedAt}}, @{label="UId";expression={$_.uid}}, @{label="IsPublic";expression={$_.isPublic}}
            $Output | Where-Object { $_.Name -eq $Name}
        }
        else {
            $Output = Invoke-RestMethod -Uri "https://api.getpostman.com/collections/$CollectionId" -Method Get -Headers $Headers
            $Output
        }
    }
    catch {
        throw
    }

}

        
    
