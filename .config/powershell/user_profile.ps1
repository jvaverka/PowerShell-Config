# Prompt
Import-Module posh-git
Import-Module oh-my-posh
function Get-ScriptDirectory { Split-Path $MyInvocation.ScriptName }
$PROMPT_CONFIG = Join-Path (Get-ScriptDirectory) 'consequential.omp.json'
oh-my-posh --init --shell pwsh --config $PROMPT_CONFIG | Invoke-Expression

# Icons
Import-Module Terminal-Icons

# PSReadline
Import-Module PSReadline
Set-PSReadLineOption -EditMode Vi
Set-PSReadLineOption -ViModeIndicator Prompt
Set-PSReadLineOption -BellStyle None
# Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineOption -PredictionSource History

# Fzf
Import-Module PSFzf
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+f' -PSReadlineChordReverseHistory 'Ctrl+r'

# Aliases
Set-Alias c clear
Set-Alias code VSCodium
Set-Alias g git
Set-Alias grep findstr
Set-Alias j julia
Set-Alias less 'C:\Program Files\Git\usr\bin\less.exe'
Set-Alias ll ls
Set-Alias lg lazygit
Set-Alias tig 'C:\Program Files\Git\usr\bin\tig.exe'
Set-Alias vim nvim
Set-Alias v nvim

# Utilities
function which ($command) {
  Get-Command -Name $command -ErrorAction SilentlyContinue |
    Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}
