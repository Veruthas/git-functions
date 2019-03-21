function git-archive {    
    
    [CmdletBinding(DefaultParameterSetName = 'SubBranch')]
    param 
    (                
        [string]
        $branch,

        [switch]
        $date,
        
        [switch]
        $datetime
    )
    
    if ($date) { $subBranch = Get-Date -FORMAT yyyy-MM-dd }
    if ($datetime) { $subBranch = Get-Date -FORMAT yyyy-MM-dd_HH-mm }
    
    $tag = Write-Output archive/$branch
    
    if ($subBranch) { $tag = Write-Output $tag/$subBranch }
    
    git tag $tag $branch
    git push origin $tag

    git branch -d $branch
    git push origin :$branch
}