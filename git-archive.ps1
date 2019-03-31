function git-archive {    
    
    # git-archive <branch> [-date|-datetime]
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
    
    git.exe tag $tag $branch
    git.exe push origin $tag

    git.exe branch -d $branch
    git.exe push origin :$branch
}