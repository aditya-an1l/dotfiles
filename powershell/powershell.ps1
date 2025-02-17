# Wezterm Configuration File
# Author: aditya-an1l
# Description: 
#    I use powershell as the default terminal 
#    in the Wezterm. The following are some 
#    config that includes the Powershell plugins 
#    I use

# Oh-My-Posh provides the theme for the terminal. Visit https://ohmyposh.dev/ to know more
oh-my-posh.exe init pwsh --config "path/to/your/theme"  | Invoke-Expression 

Set-Alias c clear
Set-Alias n nvim
Set-Alias rn rename-Item 
Set-Alias l ls 

Import-Module PSFzf
Import-Module PSReadLine
Import-Module ZLocation

Set-PSReadLineKeyHandler -Key Tab -Function Complete 
Set-PSReadLineOption -EditMode Vi -PredictionViewStyle InlineView
# Override default tab completion
#Set-PSReadLineKeyHandler -Key Tab -ScriptBlock { Invoke-FzfTabCompletion }

# Override PSReadLine's history search
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+t' `
                -PSReadlineChordReverseHistory 'Ctrl+r'


# make and cd into the directory
function mkc {
    param (
        [string]$directoryName
    )

    if (-not $directoryName) {
        Write-Host "Please provide a directory name."
        return
    }

    # Create the directory
    mkdir $directoryName

    # Change to the new directory
    Set-Location $directoryName
}

function cdc {
    param (
        [string]$inputPath
    )
    
    # Change directory to the specified input path
    cd $inputPath
    
    # List the contents of the current directory
    ls
}

function whereis ($command){
    Get-Command -Name $command -ErrorAction SilentlyContinue| 
    Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
  }

