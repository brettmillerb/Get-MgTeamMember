Get-InstalledModule Microsoft.Graph

Find-MgGraphCommand -command Get-MgTeamMember | Select-Object -First 1 -ExpandProperty Permissions

Connect-MgGraph -Scopes "TeamMember.Read.All","TeamMember.ReadWrite.All"

$teamId = "ad52f8e5-1ed9-40c4-b1a0-0c5f6d62675e"
$output = Get-MgTeamMember -TeamId $teamId

$output | Select-Object -Property (
    'displayName',
    'roles',
    @{name='email'; expression={$_.additionalproperties.email}}
)