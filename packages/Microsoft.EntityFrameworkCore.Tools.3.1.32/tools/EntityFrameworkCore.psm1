$ErrorActionPreference = 'Stop'

#
# Add-Migration
#

Register-TabExpansion Add-Migration @{
    OutputDir = { <# Disabled. Otherwise, paths would be relative to the solution directory. #> }
    Context = { param($x) GetContextTypes $x.Project $x.StartupProject }
    Project = { GetProjects }
    StartupProject = { GetProjects }
}

<#
.SYNOPSIS
    Adds a new migration.

.DESCRIPTION
    Adds a new migration.

.PARAMETER Name
    The name of the migration.

.PARAMETER OutputDir
    The directory (and sub-namespace) to use. Paths are relative to the project directory. Defaults to "Migrations".

.PARAMETER Context
    The DbContext type to use.

.PARAMETER Project
    The project to use.

.PARAMETER StartupProject
    The startup project to use. Defaults to the solution's startup project.

.LINK
    Remove-Migration
    Update-Database
    about_EntityFrameworkCore
#>
function Add-Migration
{
    [CmdletBinding(PositionalBinding = $false)]
    param(
        [Parameter(Position = 0, Mandatory = $true)]
        [string] $Name,
        [string] $OutputDir,
        [string] $Context,
        [string] $Project,
        [string] $StartupProject)

    WarnIfEF6 'Add-Migration'

    $dteProject = GetProject $Project
    $dteStartupProject = GetStartupProject $StartupProject $dteProject

    $params = 'migrations', 'add', $Name, '--json'

    if ($OutputDir)
    {
        $params += '--output-dir', $OutputDir
    }

    $params += GetParams $Context

    # NB: -join is here to support ConvertFrom-Json on PowerShell 3.0
    $result = (EF $dteProject $dteStartupProject $params) -join "`n" | ConvertFrom-Json
    Write-Host 'To undo this action, use Remove-Migration.'

    $dteProject.ProjectItems.AddFromFile($result.migrationFile) | Out-Null
    $DTE.ItemOperations.OpenFile($result.migrationFile) | Out-Null
    ShowConsole

    $dteProject.ProjectItems.AddFromFile($result.metadataFile) | Out-Null

    $dteProject.ProjectItems.AddFromFile($result.snapshotFile) | Out-Null
}

#
# Drop-Database
#

Register-TabExpansion Drop-Database @{
    Context = { param($x) GetContextTypes $x.Project $x.StartupProject }
    Project = { GetProjects }
    StartupProject = { GetProjects }
}

<#
.SYNOPSIS
    Drops the database.

.DESCRIPTION
    Drops the database.

.PARAMETER Context
    The DbContext to use.

.PARAMETER Project
    The project to use.

.PARAMETER StartupProject
    The startup project to use. Defaults to the solution's startup project.

.LINK
    Update-Database
    about_EntityFrameworkCore
#>
function Drop-Database
{
    [CmdletBinding(PositionalBinding = $false, SupportsShouldProcess = $true, ConfirmImpact = 'High')]
    param([string] $Context, [string] $Project, [string] $StartupProject)

    $dteProject = GetProject $Project
    $dteStartupProject = GetStartupProject $StartupProject $dteProject

    $info = Get-DbContext -Context $Context -Project $Project -StartupProject $StartupProject

    if ($PSCmdlet.ShouldProcess("database '$($info.databaseName)' on server '$($info.dataSource)'"))
    {
        $params = 'database', 'drop', '--force'
        $params += GetParams $Context

        EF $dteProject $dteStartupProject $params -skipBuild
    }
}

#
# Enable-Migrations (Obsolete)
#

function Enable-Migrations
{
    WarnIfEF6 'Enable-Migrations'
    Write-Warning 'Enable-Migrations is obsolete. Use Add-Migration to start using Migrations.'
}

#
# Get-DbContext
#

Register-TabExpansion Get-DbContext @{
    Context = { param($x) GetContextTypes $x.Project $x.StartupProject }
    Project = { GetProjects }
    StartupProject = { GetProjects }
}

<#
.SYNOPSIS
    Gets information about DbContext types.

.DESCRIPTION
    Gets information about DbContext types.

.PARAMETER Context
    The DbContext to use.

.PARAMETER Project
    The project to use.

.PARAMETER StartupProject
    The startup project to use. Defaults to the solution's startup project.

.LINK
    about_EntityFrameworkCore
#>
function Get-DbContext
{
    [CmdletBinding(PositionalBinding = $false)]
    param([string] $Context, [string] $Project, [string] $StartupProject)

    $dteProject = GetProject $Project
    $dteStartupProject = GetStartupProject $StartupProject $dteProject

    if ($PSBoundParameters.ContainsKey('Context'))
    {
       $params = 'dbcontext', 'info', '--json'
       $params += GetParams $Context
       # NB: -join is here to support ConvertFrom-Json on PowerShell 3.0
       return (EF $dteProject $dteStartupProject $params) -join "`n" | ConvertFrom-Json
    }
    else
    {
       $params = 'dbcontext', 'list', '--json'
       # NB: -join is here to support ConvertFrom-Json on PowerShell 3.0
       return (EF $dteProject $dteStartupProject $params) -join "`n" | ConvertFrom-Json | Format-Table -Property safeName -HideTableHeaders
    }
}

#
# Remove-Migration
#

Register-TabExpansion Remove-Migration @{
    Context = { param($x) GetContextTypes $x.Project $x.StartupProject }
    Project = { GetProjects }
    StartupProject = { GetProjects }
}

<#
.SYNOPSIS
    Removes the last migration.

.DESCRIPTION
    Removes the last migration.

.PARAMETER Force
    Revert the migration if it has been applied to the database.

.PARAMETER Context
    The DbContext to use.

.PARAMETER Project
    The project to use.

.PARAMETER StartupProject
    The startup project to use. Defaults to the solution's startup project.

.LINK
    Add-Migration
    about_EntityFrameworkCore
#>
function Remove-Migration
{
    [CmdletBinding(PositionalBinding = $false)]
    param([switch] $Force, [string] $Context, [string] $Project, [string] $StartupProject)

    $dteProject = GetProject $Project
    $dteStartupProject = GetStartupProject $StartupProject $dteProject

    $params = 'migrations', 'remove', '--json'

    if ($Force)
    {
        $params += '--force'
    }

    $params += GetParams $Context

    # NB: -join is here to support ConvertFrom-Json on PowerShell 3.0
    $result = (EF $dteProject $dteStartupProject $params) -join "`n" | ConvertFrom-Json

    $files = $result.migrationFile, $result.metadataFile, $result.snapshotFile
    $files | ?{ $_ -ne $null } | %{
        $projectItem = GetProjectItem $dteProject $_
        if ($projectItem)
        {
            $projectItem.Remove()
        }
    }
}

#
# Scaffold-DbContext
#

Register-TabExpansion Scaffold-DbContext @{
    Provider = { param($x) GetProviders $x.Project }
    Project = { GetProjects }
    StartupProject = { GetProjects }
    OutputDir = { <# Disabled. Otherwise, paths would be relative to the solution directory. #> }
    ContextDir = { <# Disabled. Otherwise, paths would be relative to the solution directory. #> }
}

<#
.SYNOPSIS
    Scaffolds a DbContext and entity types for a database.

.DESCRIPTION
    Scaffolds a DbContext and entity types for a database.

.PARAMETER Connection
    The connection string to the database.

.PARAMETER Provider
    The provider to use. (E.g. Microsoft.EntityFrameworkCore.SqlServer)

.PARAMETER OutputDir
    The directory to put files in. Paths are relative to the project directory.

.PARAMETER ContextDir
    The directory to put DbContext file in. Paths are relative to the project directory.

.PARAMETER Context
    The name of the DbContext to generate.

.PARAMETER Schemas
    The schemas of tables to generate entity types for.

.PARAMETER Tables
    The tables to generate entity types for.

.PARAMETER DataAnnotations
    Use attributes to configure the model (where possible). If omitted, only the fluent API is used.

.PARAMETER UseDatabaseNames
    Use table and column names directly from the database.

.PARAMETER Force
    Overwrite existing files.

.PARAMETER Project
    The project to use.

.PARAMETER StartupProject
    The startup project to use. Defaults to the solution's startup project.

.LINK
    about_EntityFrameworkCore
#>
function Scaffold-DbContext
{
    [CmdletBinding(PositionalBinding = $false)]
    param(
        [Parameter(Position = 0, Mandatory = $true)]
        [string] $Connection,
        [Parameter(Position = 1, Mandatory = $true)]
        [string] $Provider,
        [string] $OutputDir,
        [string] $ContextDir,
        [string] $Context,
        [string[]] $Schemas = @(),
        [string[]] $Tables = @(),
        [switch] $DataAnnotations,
        [switch] $UseDatabaseNames,
        [switch] $Force,
        [string] $Project,
        [string] $StartupProject)

    $dteProject = GetProject $Project
    $dteStartupProject = GetStartupProject $StartupProject $dteProject

    $params = 'dbcontext', 'scaffold', $Connection, $Provider, '--json'

    if ($OutputDir)
    {
        $params += '--output-dir', $OutputDir
    }

    if ($ContextDir)
    {
        $params += '--context-dir', $ContextDir
    }

    if ($Context)
    {
        $params += '--context', $Context
    }

    $params += $Schemas | %{ '--schema', $_ }
    $params += $Tables | %{ '--table', $_ }

    if ($DataAnnotations)
    {
        $params += '--data-annotations'
    }

    if ($UseDatabaseNames)
    {
        $params += '--use-database-names'
    }

    if ($Force)
    {
        $params += '--force'
    }

    # NB: -join is here to support ConvertFrom-Json on PowerShell 3.0
    $result = (EF $dteProject $dteStartupProject $params) -join "`n" | ConvertFrom-Json

    $files = $result.entityTypeFiles + $result.contextFile
    $files | %{ $dteProject.ProjectItems.AddFromFile($_) | Out-Null }
    $DTE.ItemOperations.OpenFile($result.contextFile) | Out-Null
    ShowConsole
}

#
# Script-DbContext
#

Register-TabExpansion Script-DbContext @{
    Context = { param($x) GetContextTypes $x.Project $x.StartupProject }
    Project = { GetProjects }
    StartupProject = { GetProjects }
}

<#
.SYNOPSIS
    Generates a SQL script from current DbContext.

.DESCRIPTION
    Generates a SQL script from current DbContext.

.PARAMETER Output
    The file to write the result to.

.PARAMETER Context
    The DbContext to use.

.PARAMETER Project
    The project to use.

.PARAMETER StartupProject
    The startup project to use. Defaults to the solution's startup project.

.LINK
    about_EntityFrameworkCore
#>
function Script-DbContext
{
    [CmdletBinding(PositionalBinding = $false)]
    param(
        [string] $Output,
        [string] $Context,
        [string] $Project,
        [string] $StartupProject)

    $dteProject = GetProject $Project
    $dteStartupProject = GetStartupProject $StartupProject $dteProject

    if (!$Output)
    {
        $intermediatePath = GetIntermediatePath $dteProject
        if (![IO.Path]::IsPathRooted($intermediatePath))
        {
            $projectDir = GetProperty $dteProject.Properties 'FullPath'
            $intermediatePath = Join-Path $projectDir $intermediatePath -Resolve | Convert-Path
        }

        $scriptFileName = [IO.Path]::ChangeExtension([IO.Path]::GetRandomFileName(), '.sql')
        $Output = Join-Path $intermediatePath $scriptFileName
    }
    elseif (![IO.Path]::IsPathRooted($Output))
    {
        $Output = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($Output)
    }

    $params = 'dbcontext', 'script', '--output', $Output

    $params += GetParams $Context

    EF $dteProject $dteStartupProject $params

    $DTE.ItemOperations.OpenFile($Output) | Out-Null
    ShowConsole
}

#
# Script-Migration
#

Register-TabExpansion Script-Migration @{
    From = { param($x) GetMigrations $x.Context $x.Project $x.StartupProject }
    To = { param($x) GetMigrations $x.Context $x.Project $x.StartupProject }
    Context = { param($x) GetContextTypes $x.Project $x.StartupProject }
    Project = { GetProjects }
    StartupProject = { GetProjects }
}

<#
.SYNOPSIS
    Generates a SQL script from migrations.

.DESCRIPTION
    Generates a SQL script from migrations.

.PARAMETER From
    The starting migration. Defaults to '0' (the initial database).

.PARAMETER To
    The ending migration. Defaults to the last migration.

.PARAMETER Idempotent
    Generate a script that can be used on a database at any migration.

.PARAMETER Output
    The file to write the result to.

.PARAMETER Context
    The DbContext to use.

.PARAMETER Project
    The project to use.

.PARAMETER StartupProject
    The startup project to use. Defaults to the solution's startup project.

.LINK
    Update-Database
    about_EntityFrameworkCore
#>
function Script-Migration
{
    [CmdletBinding(PositionalBinding = $false)]
    param(
        [Parameter(ParameterSetName = 'WithoutTo', Position = 0)]
        [Parameter(ParameterSetName = 'WithTo', Position = 0, Mandatory = $true)]
        [string] $From,
        [Parameter(ParameterSetName = 'WithTo', Position = 1, Mandatory = $true)]
        [string] $To,
        [switch] $Idempotent,
        [string] $Output,
        [string] $Context,
        [string] $Project,
        [string] $StartupProject)

    $dteProject = GetProject $Project
    $dteStartupProject = GetStartupProject $StartupProject $dteProject

    if (!$Output)
    {
        $intermediatePath = GetIntermediatePath $dteProject
        if (![IO.Path]::IsPathRooted($intermediatePath))
        {
            $projectDir = GetProperty $dteProject.Properties 'FullPath'
            $intermediatePath = Join-Path $projectDir $intermediatePath -Resolve | Convert-Path
        }

        $scriptFileName = [IO.Path]::ChangeExtension([IO.Path]::GetRandomFileName(), '.sql')
        $Output = Join-Path $intermediatePath $scriptFileName
    }
    elseif (![IO.Path]::IsPathRooted($Output))
    {
        $Output = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($Output)
    }

    $params = 'migrations', 'script', '--output', $Output

    if ($From)
    {
        $params += $From
    }

    if ($To)
    {
        $params += $To
    }

    if ($Idempotent)
    {
        $params += '--idempotent'
    }

    $params += GetParams $Context

    EF $dteProject $dteStartupProject $params

    $DTE.ItemOperations.OpenFile($Output) | Out-Null
    ShowConsole
}

#
# Update-Database
#

Register-TabExpansion Update-Database @{
    Migration = { param($x) GetMigrations $x.Context $x.Project $x.StartupProject }
    Context = { param($x) GetContextTypes $x.Project $x.StartupProject }
    Project = { GetProjects }
    StartupProject = { GetProjects }
}

<#
.SYNOPSIS
    Updates the database to a specified migration.

.DESCRIPTION
    Updates the database to a specified migration.

.PARAMETER Migration
    The target migration. If '0', all migrations will be reverted. Defaults to the last migration.

.PARAMETER Context
    The DbContext to use.

.PARAMETER Project
    The project to use.

.PARAMETER StartupProject
    The startup project to use. Defaults to the solution's startup project.

.LINK
    Script-Migration
    about_EntityFrameworkCore
#>
function Update-Database
{
    [CmdletBinding(PositionalBinding = $false)]
    param(
        [Parameter(Position = 0)]
        [string] $Migration,
        [string] $Context,
        [string] $Project,
        [string] $StartupProject)

    WarnIfEF6 'Update-Database'

    $dteProject = GetProject $Project
    $dteStartupProject = GetStartupProject $StartupProject $dteProject

    $params = 'database', 'update'

    if ($Migration)
    {
        $params += $Migration
    }

    $params += GetParams $Context

    EF $dteProject $dteStartupProject $params
}

#
# (Private Helpers)
#

function GetProjects
{
    return Get-Project -All | %{ $_.ProjectName }
}

function GetProviders($projectName)
{
    if (!$projectName)
    {
        $projectName = (Get-Project).ProjectName
    }

    return Get-Package -ProjectName $projectName | %{ $_.Id }
}

function GetContextTypes($projectName, $startupProjectName)
{
    $project = GetProject $projectName
    $startupProject = GetStartupProject $startupProjectName $project

    $params = 'dbcontext', 'list', '--json'

    # NB: -join is here to support ConvertFrom-Json on PowerShell 3.0
    $result = (EF $project $startupProject $params -skipBuild) -join "`n" | ConvertFrom-Json

    return $result | %{ $_.safeName }
}

function GetMigrations($context, $projectName, $startupProjectName)
{
    $project = GetProject $projectName
    $startupProject = GetStartupProject $startupProjectName $project

    $params = 'migrations', 'list', '--json'
    $params += GetParams $context

    # NB: -join is here to support ConvertFrom-Json on PowerShell 3.0
    $result = (EF $project $startupProject $params -skipBuild) -join "`n" | ConvertFrom-Json

    return $result | %{ $_.safeName }
}

function WarnIfEF6($cmdlet)
{
    if (Get-Module 'EntityFramework6')
    {
        Write-Warning "Both Entity Framework Core and Entity Framework 6 are installed. The Entity Framework Core tools are running. Use 'EntityFramework6\$cmdlet' for Entity Framework 6."
    }
    elseif (Get-Module 'EntityFramework')
    {
        Write-Warning "Both Entity Framework Core and Entity Framework 6 are installed. The Entity Framework Core tools are running. Use 'EntityFramework\$cmdlet' for Entity Framework 6."
    }
}

function GetProject($projectName)
{
    if (!$projectName)
    {
        return Get-Project
    }

    return Get-Project $projectName
}

function GetStartupProject($name, $fallbackProject)
{
    if ($name)
    {
        return Get-Project $name
    }

    $startupProjectPaths = $DTE.Solution.SolutionBuild.StartupProjects
    if ($startupProjectPaths)
    {
        if ($startupProjectPaths.Length -eq 1)
        {
            $startupProjectPath = $startupProjectPaths[0]
            if (![IO.Path]::IsPathRooted($startupProjectPath))
            {
                $solutionPath = Split-Path (GetProperty $DTE.Solution.Properties 'Path')
                $startupProjectPath = Join-Path $solutionPath $startupProjectPath -Resolve | Convert-Path
            }

            $startupProject = GetSolutionProjects | ?{
                try
                {
                    $fullName = $_.FullName
                }
                catch [NotImplementedException]
                {
                    return $false
                }

                if ($fullName -and $fullName.EndsWith('\'))
                {
                    $fullName = $fullName.Substring(0, $fullName.Length - 1)
                }

                return $fullName -eq $startupProjectPath
            }
            if ($startupProject)
            {
                return $startupProject
            }

            Write-Warning "Unable to resolve startup project '$startupProjectPath'."
        }
        else
        {
            Write-Warning 'Multiple startup projects set.'
        }
    }
    else
    {
        Write-Warning 'No startup project set.'
    }

    Write-Warning "Using project '$($fallbackProject.ProjectName)' as the startup project."

    return $fallbackProject
}

function GetSolutionProjects()
{
    $projects = New-Object 'System.Collections.Stack'

    $DTE.Solution.Projects | %{
        $projects.Push($_)
    }

    while ($projects.Count)
    {
        $project = $projects.Pop();

        <# yield return #> $project

        if ($project.ProjectItems)
        {
            $project.ProjectItems | ?{ $_.SubProject } | %{
                $projects.Push($_.SubProject)
            }
        }
    }
}

function GetParams($context)
{
    $params = @()

    if ($context)
    {
        $params += '--context', $context
    }

    return $params
}

function ShowConsole
{
    $componentModel = Get-VSComponentModel
    $powerConsoleWindow = $componentModel.GetService([NuGetConsole.IPowerConsoleWindow])
    $powerConsoleWindow.Show()
}

function WriteErrorLine($message)
{
    try
    {
        # Call the internal API NuGet uses to display errors
        $componentModel = Get-VSComponentModel
        $powerConsoleWindow = $componentModel.GetService([NuGetConsole.IPowerConsoleWindow])
        $bindingFlags = [Reflection.BindingFlags]::Instance -bor [Reflection.BindingFlags]::NonPublic
        $activeHostInfo = $powerConsoleWindow.GetType().GetProperty('ActiveHostInfo', $bindingFlags).GetValue($powerConsoleWindow)
        $internalHost = $activeHostInfo.WpfConsole.Host
        $reportErrorMethod = $internalHost.GetType().GetMethod('ReportError', $bindingFlags, $null, [Exception], $null)
        $exception = New-Object Exception $message
        $reportErrorMethod.Invoke($internalHost, $exception)
    }
    catch
    {
        Write-Host $message -ForegroundColor DarkRed
    }
}

function EF($project, $startupProject, $params, [switch] $skipBuild)
{
    if (IsDocker $startupProject)
    {
        throw "Startup project '$($startupProject.ProjectName)' is a Docker project. Select an ASP.NET Core Web " +
            'Application as your startup project and try again.'
    }
    if (IsUWP $startupProject)
    {
        throw "Startup project '$($startupProject.ProjectName)' is a Universal Windows Platform app. This version of " +
            'the Entity Framework Core Package Manager Console Tools doesn''t support this type of project. For more ' +
            'information on using the EF Core Tools with UWP projects, see ' +
            'https://go.microsoft.com/fwlink/?linkid=858496'
    }

    Write-Verbose "Using project '$($project.ProjectName)'."
    Write-Verbose "Using startup project '$($startupProject.ProjectName)'."

    if (!$skipBuild)
    {
        Write-Host 'Build started...'

        # TODO: Only build startup project. Don't use BuildProject, you can't specify platform
        $solutionBuild = $DTE.Solution.SolutionBuild
        $solutionBuild.Build(<# WaitForBuildToFinish: #> $true)
        if ($solutionBuild.LastBuildInfo)
        {
            throw 'Build failed.'
        }

        Write-Host 'Build succeeded.'
    }

    $startupProjectDir = GetProperty $startupProject.Properties 'FullPath'
    $outputPath = GetProperty $startupProject.ConfigurationManager.ActiveConfiguration.Properties 'OutputPath'
    $targetDir = [IO.Path]::GetFullPath([IO.Path]::Combine($startupProjectDir, $outputPath))
    $startupTargetFileName = GetProperty $startupProject.Properties 'OutputFileName'
    $startupTargetPath = Join-Path $targetDir $startupTargetFileName
    $targetFrameworkMoniker = GetProperty $startupProject.Properties 'TargetFrameworkMoniker'
    $frameworkName = New-Object 'System.Runtime.Versioning.FrameworkName' $targetFrameworkMoniker
    $targetFramework = $frameworkName.Identifier

    if ($targetFramework -in '.NETFramework')
    {
        $platformTarget = GetPlatformTarget $startupProject
        if ($platformTarget -eq 'x86')
        {
            $exePath = Join-Path $PSScriptRoot 'net461\win-x86\ef.exe'
        }
        elseif ($platformTarget -eq 'ARM64')
        {
            $exePath = Join-Path $PSScriptRoot 'net461\win-arm64\ef.exe'
        }
        elseif ($platformTarget -in 'AnyCPU', 'x64')
        {
            $exePath = Join-Path $PSScriptRoot 'net461\any\ef.exe'
        }
        else
        {
            throw "Startup project '$($startupProject.ProjectName)' has an active platform of '$platformTarget'. Select " +
                'a different platform and try again.'
        }
    }
    elseif ($targetFramework -eq '.NETCoreApp')
    {
        $exePath = (Get-Command 'dotnet').Path

        $startupTargetName = GetProperty $startupProject.Properties 'AssemblyName'
        $depsFile = Join-Path $targetDir ($startupTargetName + '.deps.json')
        $projectAssetsFile = GetCpsProperty $startupProject 'ProjectAssetsFile'
        $runtimeConfig = Join-Path $targetDir ($startupTargetName + '.runtimeconfig.json')
        $runtimeFrameworkVersion = GetCpsProperty $startupProject 'RuntimeFrameworkVersion'
        $efPath = Join-Path $PSScriptRoot 'netcoreapp2.0\any\ef.dll'

        $dotnetParams = 'exec', '--depsfile', $depsFile

        if ($projectAssetsFile)
        {
            # NB: Don't use Get-Content. It doesn't handle UTF-8 without a signature
            # NB: Don't use ReadAllLines. ConvertFrom-Json won't work on PowerShell 3.0
            $projectAssets = [IO.File]::ReadAllText($projectAssetsFile) | ConvertFrom-Json
            $projectAssets.packageFolders.psobject.Properties.Name | %{
                $dotnetParams += '--additionalprobingpath', $_.TrimEnd('\')
            }
        }

        if (Test-Path $runtimeConfig)
        {
            $dotnetParams += '--runtimeconfig', $runtimeConfig
        }
        elseif ($runtimeFrameworkVersion)
        {
            $dotnetParams += '--fx-version', $runtimeFrameworkVersion
        }

        $dotnetParams += $efPath

        $params = $dotnetParams + $params
    }
    elseif ($targetFramework -eq '.NETStandard')
    {
        throw "Startup project '$($startupProject.ProjectName)' targets framework '.NETStandard'. There is no " +
            'runtime associated with this framework, and projects targeting it cannot be executed directly. To use ' +
            'the Entity Framework Core Package Manager Console Tools with this project, add an executable project ' +
            'targeting .NET Framework or .NET Core that references this project, and set it as the startup project; ' +
            'or, update this project to cross-target .NET Framework or .NET Core. For more information on using the ' +
            'EF Core Tools with .NET Standard projects, see https://go.microsoft.com/fwlink/?linkid=2034705'
    }
    else
    {
        throw "Startup project '$($startupProject.ProjectName)' targets framework '$targetFramework'. " +
            'The Entity Framework Core Package Manager Console Tools don''t support this framework.'
    }

    $projectDir = GetProperty $project.Properties 'FullPath'
    $targetFileName = GetProperty $project.Properties 'OutputFileName'
    $targetPath = Join-Path $targetDir $targetFileName
    $rootNamespace = GetProperty $project.Properties 'RootNamespace'
    $language = GetLanguage $project

    $params += '--verbose',
        '--no-color',
        '--prefix-output',
        '--assembly', $targetPath,
        '--startup-assembly', $startupTargetPath,
        '--project-dir', $projectDir,
        '--language', $language,
        '--working-dir', $PWD.Path

    if (IsWeb $startupProject)
    {
        $params += '--data-dir', (Join-Path $startupProjectDir 'App_Data')
    }

    if ($rootNamespace)
    {
        $params += '--root-namespace', $rootNamespace
    }

    $arguments = ToArguments $params
    $startInfo = New-Object 'System.Diagnostics.ProcessStartInfo' -Property @{
        FileName = $exePath;
        Arguments = $arguments;
        UseShellExecute = $false;
        CreateNoWindow = $true;
        RedirectStandardOutput = $true;
        StandardOutputEncoding = [Text.Encoding]::UTF8;
        RedirectStandardError = $true;
        WorkingDirectory = $startupProjectDir;
    }

    Write-Verbose "$exePath $arguments"

    $process = [Diagnostics.Process]::Start($startInfo)

    while (($line = $process.StandardOutput.ReadLine()) -ne $null)
    {
        $level = $null
        $text = $null

        $parts = $line.Split(':', 2)
        if ($parts.Length -eq 2)
        {
            $level = $parts[0]

            $i = 0
            $count = 8 - $level.Length
            while ($i -lt $count -and $parts[1][$i] -eq ' ')
            {
                $i++
            }

            $text = $parts[1].Substring($i)
        }

        switch ($level)
        {
            'error' { WriteErrorLine $text }
            'warn' { Write-Warning $text }
            'info' { Write-Host $text }
            'data' { Write-Output $text }
            'verbose' { Write-Verbose $text }
            default { Write-Host $line }
        }
    }

    $process.WaitForExit()

    if ($process.ExitCode)
    {
        while (($line = $process.StandardError.ReadLine()) -ne $null)
        {
            WriteErrorLine $line
        }

        exit
    }
}

function IsDocker($project)
{
    return $project.Kind -eq '{E53339B2-1760-4266-BCC7-CA923CBCF16C}'
}

function IsCpsProject($project)
{
    $hierarchy = GetVsHierarchy $project
    $isCapabilityMatch = [Microsoft.VisualStudio.Shell.PackageUtilities].GetMethod(
        'IsCapabilityMatch',
        [type[]]([Microsoft.VisualStudio.Shell.Interop.IVsHierarchy], [string]))

    return $isCapabilityMatch.Invoke($null, ($hierarchy, 'CPS'))
}

function IsWeb($project)
{
    $types = GetProjectTypes $project

    return $types -contains '{349C5851-65DF-11DA-9384-00065B846F21}'
}

function IsUWP($project)
{
    $types = GetProjectTypes $project

    return $types -contains '{A5A43C5B-DE2A-4C0C-9213-0A381AF9435A}'
}

function GetIntermediatePath($project)
{
    $intermediatePath = GetProperty $project.ConfigurationManager.ActiveConfiguration.Properties 'IntermediatePath'
    if ($intermediatePath)
    {
        return $intermediatePath
    }

    return GetMSBuildProperty $project 'IntermediateOutputPath'
}

function GetPlatformTarget($project)
{
    if (IsCpsProject $project)
    {
        $platformTarget = GetCpsProperty $project 'PlatformTarget'
        if ($platformTarget)
        {
            return $platformTarget
        }

        return GetCpsProperty $project 'Platform'
    }

    $platformTarget = GetProperty $project.ConfigurationManager.ActiveConfiguration.Properties 'PlatformTarget'
    if ($platformTarget)
    {
        return $platformTarget
    }

    # NB: For classic F# projects
    $platformTarget = GetMSBuildProperty $project 'PlatformTarget'
    if ($platformTarget)
    {
        return $platformTarget
    }

    return 'AnyCPU'
}

function GetLanguage($project)
{
    if (IsCpsProject $project)
    {
        return GetCpsProperty $project 'Language'
    }

    return GetMSBuildProperty $project 'Language'
}

function GetVsHierarchy($project)
{
    $solution = Get-VSService 'Microsoft.VisualStudio.Shell.Interop.SVsSolution' 'Microsoft.VisualStudio.Shell.Interop.IVsSolution'
    $hierarchy = $null
    $hr = $solution.GetProjectOfUniqueName($project.UniqueName, [ref] $hierarchy)
    [Runtime.InteropServices.Marshal]::ThrowExceptionForHR($hr)

    return $hierarchy
}

function GetProjectTypes($project)
{
    $hierarchy = GetVsHierarchy $project
    $aggregatableProject = Get-Interface $hierarchy 'Microsoft.VisualStudio.Shell.Interop.IVsAggregatableProject'
    if (!$aggregatableProject)
    {
        return $project.Kind
    }

    $projectTypeGuidsString = $null
    $hr = $aggregatableProject.GetAggregateProjectTypeGuids([ref] $projectTypeGuidsString)
    [Runtime.InteropServices.Marshal]::ThrowExceptionForHR($hr)

    return $projectTypeGuidsString.Split(';')
}

function GetProperty($properties, $propertyName)
{
    try
    {
        return $properties.Item($propertyName).Value
    }
    catch
    {
        return $null
    }
}

function GetCpsProperty($project, $propertyName)
{
    $browseObjectContext = Get-Interface $project 'Microsoft.VisualStudio.ProjectSystem.Properties.IVsBrowseObjectContext'
    $unconfiguredProject = $browseObjectContext.UnconfiguredProject
    $configuredProject = $unconfiguredProject.GetSuggestedConfiguredProjectAsync().Result
    $properties = $configuredProject.Services.ProjectPropertiesProvider.GetCommonProperties()

    return $properties.GetEvaluatedPropertyValueAsync($propertyName).Result
}

function GetMSBuildProperty($project, $propertyName)
{
    $msbuildProject = [Microsoft.Build.Evaluation.ProjectCollection]::GlobalProjectCollection.LoadedProjects |
        ? FullPath -eq $project.FullName

    return $msbuildProject.GetProperty($propertyName).EvaluatedValue
}

function GetProjectItem($project, $path)
{
    $fullPath = GetProperty $project.Properties 'FullPath'

    if ([IO.Path]::IsPathRooted($path))
    {
        $path = $path.Substring($fullPath.Length)
    }

    $itemDirectory = (Split-Path $path -Parent)

    $projectItems = $project.ProjectItems
    if ($itemDirectory)
    {
        $directories = $itemDirectory.Split('\')
        $directories | %{
            if ($projectItems)
            {
                $projectItems = $projectItems.Item($_).ProjectItems
            }
        }
    }

    if (!$projectItems)
    {
        return $null
    }

    $itemName = Split-Path $path -Leaf

    try
    {
        return $projectItems.Item($itemName)
    }
    catch [Exception]
    {
    }

    return $null
}

function ToArguments($params)
{
    $arguments = ''
    for ($i = 0; $i -lt $params.Length; $i++)
    {
        if ($i)
        {
            $arguments += ' '
        }

        if (!$params[$i].Contains(' '))
        {
            $arguments += $params[$i]

            continue
        }

        $arguments += '"'

        $pendingBackslashs = 0
        for ($j = 0; $j -lt $params[$i].Length; $j++)
        {
            switch ($params[$i][$j])
            {
                '"'
                {
                    if ($pendingBackslashs)
                    {
                        $arguments += '\' * $pendingBackslashs * 2
                        $pendingBackslashs = 0
                    }
                    $arguments += '\"'
                }

                '\'
                {
                    $pendingBackslashs++
                }

                default
                {
                    if ($pendingBackslashs)
                    {
                        if ($pendingBackslashs -eq 1)
                        {
                            $arguments += '\'
                        }
                        else
                        {
                            $arguments += '\' * $pendingBackslashs * 2
                        }

                        $pendingBackslashs = 0
                    }

                    $arguments += $params[$i][$j]
                }
            }
        }

        if ($pendingBackslashs)
        {
            $arguments += '\' * $pendingBackslashs * 2
        }

        $arguments += '"'
    }

    return $arguments
}

# SIG # Begin signature block
# MIInngYJKoZIhvcNAQcCoIInjzCCJ4sCAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCA4jBAvaQZ5a6MU
# Ayui7kvL/gZ2tWBHiZaVjSjfCVmz86CCDYEwggX/MIID56ADAgECAhMzAAACzI61
# lqa90clOAAAAAALMMA0GCSqGSIb3DQEBCwUAMH4xCzAJBgNVBAYTAlVTMRMwEQYD
# VQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNy
# b3NvZnQgQ29ycG9yYXRpb24xKDAmBgNVBAMTH01pY3Jvc29mdCBDb2RlIFNpZ25p
# bmcgUENBIDIwMTEwHhcNMjIwNTEyMjA0NjAxWhcNMjMwNTExMjA0NjAxWjB0MQsw
# CQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9u
# ZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMR4wHAYDVQQDExVNaWNy
# b3NvZnQgQ29ycG9yYXRpb24wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIB
# AQCiTbHs68bADvNud97NzcdP0zh0mRr4VpDv68KobjQFybVAuVgiINf9aG2zQtWK
# No6+2X2Ix65KGcBXuZyEi0oBUAAGnIe5O5q/Y0Ij0WwDyMWaVad2Te4r1Eic3HWH
# UfiiNjF0ETHKg3qa7DCyUqwsR9q5SaXuHlYCwM+m59Nl3jKnYnKLLfzhl13wImV9
# DF8N76ANkRyK6BYoc9I6hHF2MCTQYWbQ4fXgzKhgzj4zeabWgfu+ZJCiFLkogvc0
# RVb0x3DtyxMbl/3e45Eu+sn/x6EVwbJZVvtQYcmdGF1yAYht+JnNmWwAxL8MgHMz
# xEcoY1Q1JtstiY3+u3ulGMvhAgMBAAGjggF+MIIBejAfBgNVHSUEGDAWBgorBgEE
# AYI3TAgBBggrBgEFBQcDAzAdBgNVHQ4EFgQUiLhHjTKWzIqVIp+sM2rOHH11rfQw
# UAYDVR0RBEkwR6RFMEMxKTAnBgNVBAsTIE1pY3Jvc29mdCBPcGVyYXRpb25zIFB1
# ZXJ0byBSaWNvMRYwFAYDVQQFEw0yMzAwMTIrNDcwNTI5MB8GA1UdIwQYMBaAFEhu
# ZOVQBdOCqhc3NyK1bajKdQKVMFQGA1UdHwRNMEswSaBHoEWGQ2h0dHA6Ly93d3cu
# bWljcm9zb2Z0LmNvbS9wa2lvcHMvY3JsL01pY0NvZFNpZ1BDQTIwMTFfMjAxMS0w
# Ny0wOC5jcmwwYQYIKwYBBQUHAQEEVTBTMFEGCCsGAQUFBzAChkVodHRwOi8vd3d3
# Lm1pY3Jvc29mdC5jb20vcGtpb3BzL2NlcnRzL01pY0NvZFNpZ1BDQTIwMTFfMjAx
# MS0wNy0wOC5jcnQwDAYDVR0TAQH/BAIwADANBgkqhkiG9w0BAQsFAAOCAgEAeA8D
# sOAHS53MTIHYu8bbXrO6yQtRD6JfyMWeXaLu3Nc8PDnFc1efYq/F3MGx/aiwNbcs
# J2MU7BKNWTP5JQVBA2GNIeR3mScXqnOsv1XqXPvZeISDVWLaBQzceItdIwgo6B13
# vxlkkSYMvB0Dr3Yw7/W9U4Wk5K/RDOnIGvmKqKi3AwyxlV1mpefy729FKaWT7edB
# d3I4+hldMY8sdfDPjWRtJzjMjXZs41OUOwtHccPazjjC7KndzvZHx/0VWL8n0NT/
# 404vftnXKifMZkS4p2sB3oK+6kCcsyWsgS/3eYGw1Fe4MOnin1RhgrW1rHPODJTG
# AUOmW4wc3Q6KKr2zve7sMDZe9tfylonPwhk971rX8qGw6LkrGFv31IJeJSe/aUbG
# dUDPkbrABbVvPElgoj5eP3REqx5jdfkQw7tOdWkhn0jDUh2uQen9Atj3RkJyHuR0
# GUsJVMWFJdkIO/gFwzoOGlHNsmxvpANV86/1qgb1oZXdrURpzJp53MsDaBY/pxOc
# J0Cvg6uWs3kQWgKk5aBzvsX95BzdItHTpVMtVPW4q41XEvbFmUP1n6oL5rdNdrTM
# j/HXMRk1KCksax1Vxo3qv+13cCsZAaQNaIAvt5LvkshZkDZIP//0Hnq7NnWeYR3z
# 4oFiw9N2n3bb9baQWuWPswG0Dq9YT9kb+Cs4qIIwggd6MIIFYqADAgECAgphDpDS
# AAAAAAADMA0GCSqGSIb3DQEBCwUAMIGIMQswCQYDVQQGEwJVUzETMBEGA1UECBMK
# V2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0
# IENvcnBvcmF0aW9uMTIwMAYDVQQDEylNaWNyb3NvZnQgUm9vdCBDZXJ0aWZpY2F0
# ZSBBdXRob3JpdHkgMjAxMTAeFw0xMTA3MDgyMDU5MDlaFw0yNjA3MDgyMTA5MDla
# MH4xCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdS
# ZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xKDAmBgNVBAMT
# H01pY3Jvc29mdCBDb2RlIFNpZ25pbmcgUENBIDIwMTEwggIiMA0GCSqGSIb3DQEB
# AQUAA4ICDwAwggIKAoICAQCr8PpyEBwurdhuqoIQTTS68rZYIZ9CGypr6VpQqrgG
# OBoESbp/wwwe3TdrxhLYC/A4wpkGsMg51QEUMULTiQ15ZId+lGAkbK+eSZzpaF7S
# 35tTsgosw6/ZqSuuegmv15ZZymAaBelmdugyUiYSL+erCFDPs0S3XdjELgN1q2jz
# y23zOlyhFvRGuuA4ZKxuZDV4pqBjDy3TQJP4494HDdVceaVJKecNvqATd76UPe/7
# 4ytaEB9NViiienLgEjq3SV7Y7e1DkYPZe7J7hhvZPrGMXeiJT4Qa8qEvWeSQOy2u
# M1jFtz7+MtOzAz2xsq+SOH7SnYAs9U5WkSE1JcM5bmR/U7qcD60ZI4TL9LoDho33
# X/DQUr+MlIe8wCF0JV8YKLbMJyg4JZg5SjbPfLGSrhwjp6lm7GEfauEoSZ1fiOIl
# XdMhSz5SxLVXPyQD8NF6Wy/VI+NwXQ9RRnez+ADhvKwCgl/bwBWzvRvUVUvnOaEP
# 6SNJvBi4RHxF5MHDcnrgcuck379GmcXvwhxX24ON7E1JMKerjt/sW5+v/N2wZuLB
# l4F77dbtS+dJKacTKKanfWeA5opieF+yL4TXV5xcv3coKPHtbcMojyyPQDdPweGF
# RInECUzF1KVDL3SV9274eCBYLBNdYJWaPk8zhNqwiBfenk70lrC8RqBsmNLg1oiM
# CwIDAQABo4IB7TCCAekwEAYJKwYBBAGCNxUBBAMCAQAwHQYDVR0OBBYEFEhuZOVQ
# BdOCqhc3NyK1bajKdQKVMBkGCSsGAQQBgjcUAgQMHgoAUwB1AGIAQwBBMAsGA1Ud
# DwQEAwIBhjAPBgNVHRMBAf8EBTADAQH/MB8GA1UdIwQYMBaAFHItOgIxkEO5FAVO
# 4eqnxzHRI4k0MFoGA1UdHwRTMFEwT6BNoEuGSWh0dHA6Ly9jcmwubWljcm9zb2Z0
# LmNvbS9wa2kvY3JsL3Byb2R1Y3RzL01pY1Jvb0NlckF1dDIwMTFfMjAxMV8wM18y
# Mi5jcmwwXgYIKwYBBQUHAQEEUjBQME4GCCsGAQUFBzAChkJodHRwOi8vd3d3Lm1p
# Y3Jvc29mdC5jb20vcGtpL2NlcnRzL01pY1Jvb0NlckF1dDIwMTFfMjAxMV8wM18y
# Mi5jcnQwgZ8GA1UdIASBlzCBlDCBkQYJKwYBBAGCNy4DMIGDMD8GCCsGAQUFBwIB
# FjNodHRwOi8vd3d3Lm1pY3Jvc29mdC5jb20vcGtpb3BzL2RvY3MvcHJpbWFyeWNw
# cy5odG0wQAYIKwYBBQUHAgIwNB4yIB0ATABlAGcAYQBsAF8AcABvAGwAaQBjAHkA
# XwBzAHQAYQB0AGUAbQBlAG4AdAAuIB0wDQYJKoZIhvcNAQELBQADggIBAGfyhqWY
# 4FR5Gi7T2HRnIpsLlhHhY5KZQpZ90nkMkMFlXy4sPvjDctFtg/6+P+gKyju/R6mj
# 82nbY78iNaWXXWWEkH2LRlBV2AySfNIaSxzzPEKLUtCw/WvjPgcuKZvmPRul1LUd
# d5Q54ulkyUQ9eHoj8xN9ppB0g430yyYCRirCihC7pKkFDJvtaPpoLpWgKj8qa1hJ
# Yx8JaW5amJbkg/TAj/NGK978O9C9Ne9uJa7lryft0N3zDq+ZKJeYTQ49C/IIidYf
# wzIY4vDFLc5bnrRJOQrGCsLGra7lstnbFYhRRVg4MnEnGn+x9Cf43iw6IGmYslmJ
# aG5vp7d0w0AFBqYBKig+gj8TTWYLwLNN9eGPfxxvFX1Fp3blQCplo8NdUmKGwx1j
# NpeG39rz+PIWoZon4c2ll9DuXWNB41sHnIc+BncG0QaxdR8UvmFhtfDcxhsEvt9B
# xw4o7t5lL+yX9qFcltgA1qFGvVnzl6UJS0gQmYAf0AApxbGbpT9Fdx41xtKiop96
# eiL6SJUfq/tHI4D1nvi/a7dLl+LrdXga7Oo3mXkYS//WsyNodeav+vyL6wuA6mk7
# r/ww7QRMjt/fdW1jkT3RnVZOT7+AVyKheBEyIXrvQQqxP/uozKRdwaGIm1dxVk5I
# RcBCyZt2WwqASGv9eZ/BvW1taslScxMNelDNMYIZczCCGW8CAQEwgZUwfjELMAkG
# A1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1JlZG1vbmQx
# HjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjEoMCYGA1UEAxMfTWljcm9z
# b2Z0IENvZGUgU2lnbmluZyBQQ0EgMjAxMQITMwAAAsyOtZamvdHJTgAAAAACzDAN
# BglghkgBZQMEAgEFAKCBrjAZBgkqhkiG9w0BCQMxDAYKKwYBBAGCNwIBBDAcBgor
# BgEEAYI3AgELMQ4wDAYKKwYBBAGCNwIBFTAvBgkqhkiG9w0BCQQxIgQgAzS4JLmt
# /tWkQ62WQLQ6gsq9IF5ws+6wESEQrePkeXIwQgYKKwYBBAGCNwIBDDE0MDKgFIAS
# AE0AaQBjAHIAbwBzAG8AZgB0oRqAGGh0dHA6Ly93d3cubWljcm9zb2Z0LmNvbTAN
# BgkqhkiG9w0BAQEFAASCAQCW4nxgTFvVAIsZIoLhE0XUIrhPBx9geFRIC2f6yLQt
# oKvuSp8dXiEsJW5uWw+r/QMh4aLBZv76+ViOjk566VxZaxmaXptLDQMLYI3b7g3X
# w1F/xuYTrVqVSOUeom/nHyKrKbZPn33HwsiEcXgrHlSl6vasWoGlvn9jF+etq5AX
# 233a2I5Xu8mzEHNgE7dKq9SYSQzGkIpiL0WgG/FRgwNb6i+/Y2agpjp5baxHTsbP
# JD3wO0lgzDjcGNaA/P0naI0WzkPFD7T5sdWSlT6o5EPr0VnjinKQktEmFaFI+JHc
# P+mAU386ZZfuIolruTZrIVLl+QZ0yhXq80TH3Xs7hCIKoYIW/TCCFvkGCisGAQQB
# gjcDAwExghbpMIIW5QYJKoZIhvcNAQcCoIIW1jCCFtICAQMxDzANBglghkgBZQME
# AgEFADCCAVEGCyqGSIb3DQEJEAEEoIIBQASCATwwggE4AgEBBgorBgEEAYRZCgMB
# MDEwDQYJYIZIAWUDBAIBBQAEIMHsOz4uMEou8lKW3PX8HiVyGxJ+HWnyDoFDbH7g
# X5FAAgZjbQjCjRIYEzIwMjIxMTE2MjAyMDIwLjYzN1owBIACAfSggdCkgc0wgcox
# CzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRt
# b25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xJTAjBgNVBAsTHE1p
# Y3Jvc29mdCBBbWVyaWNhIE9wZXJhdGlvbnMxJjAkBgNVBAsTHVRoYWxlcyBUU1Mg
# RVNOOjNFN0EtRTM1OS1BMjVEMSUwIwYDVQQDExxNaWNyb3NvZnQgVGltZS1TdGFt
# cCBTZXJ2aWNloIIRVDCCBwwwggT0oAMCAQICEzMAAAHJ+tWOJSB0Al4AAQAAAckw
# DQYJKoZIhvcNAQELBQAwfDELMAkGA1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0
# b24xEDAOBgNVBAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3Jh
# dGlvbjEmMCQGA1UEAxMdTWljcm9zb2Z0IFRpbWUtU3RhbXAgUENBIDIwMTAwHhcN
# MjIxMTA0MTkwMTM4WhcNMjQwMjAyMTkwMTM4WjCByjELMAkGA1UEBhMCVVMxEzAR
# BgNVBAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1p
# Y3Jvc29mdCBDb3Jwb3JhdGlvbjElMCMGA1UECxMcTWljcm9zb2Z0IEFtZXJpY2Eg
# T3BlcmF0aW9uczEmMCQGA1UECxMdVGhhbGVzIFRTUyBFU046M0U3QS1FMzU5LUEy
# NUQxJTAjBgNVBAMTHE1pY3Jvc29mdCBUaW1lLVN0YW1wIFNlcnZpY2UwggIiMA0G
# CSqGSIb3DQEBAQUAA4ICDwAwggIKAoICAQDWcuLljm/Pwr5ajGGTuoZb+8LGLl65
# MzTVOIRsU4byDtIUHRUyNiCjpOJHOA5D4I3nc4E4qXIwdbNEvjG9pLTdmUiB60gg
# tiIBKiCwS2WPMSVEc7t8MYMVZx3P6UI1iYmjO1sbc8yufFuVQcdSSvgLsQEdvZjT
# sZ3kYkGA/z7kBk2xOWwcZzMezjmaY/utSBwyf/9zxD8ZhKp1Pg5cQunneH30SfIX
# jNyx3ZkWPF2PWU/xAbBllLgXzYkEZ7akKtJqTIWNPHMUpQ7BxB6vAFH9hpCXLua0
# Ktrg81zIRCb6f8sNx79VWJBrw4zacFkcrDoLIyoTMUknLkeLPPxnrGuqosq2Ly+I
# lRDQW2qRNdJHf//Dw8ArIGW8hhMUX8vLcmHdxtV46BKa5s5XC/ycx6FxBvYC3FxT
# +V3IRSrLz+2EQchY1pvMdfHk70Phu1Lqgl2AuYfGtMG0axxVCrHTPn99QiQsTu1v
# B+irzhwX9REsTLDernspXZTiA6FzfnpdgRVB0lejpUVYFANhvNqdDbnNjbVQKSPz
# bULIP3SCqs7etA+VxCjp6vBbYMXZ+yaABtWrNCzPpGSZp/Pit7XuSbup7T0+7AfD
# l7fHlkgYShWV82cm/r7znW7ApfoClkXE/N5Cjtb/kG1pOaRkSHBjkB0I+A+/Rpog
# RCfaoXsy8XAJywIDAQABo4IBNjCCATIwHQYDVR0OBBYEFAVvnWdGwjyhvng6FMV5
# UXtELjLLMB8GA1UdIwQYMBaAFJ+nFV0AXmJdg/Tl0mWnG1M1GelyMF8GA1UdHwRY
# MFYwVKBSoFCGTmh0dHA6Ly93d3cubWljcm9zb2Z0LmNvbS9wa2lvcHMvY3JsL01p
# Y3Jvc29mdCUyMFRpbWUtU3RhbXAlMjBQQ0ElMjAyMDEwKDEpLmNybDBsBggrBgEF
# BQcBAQRgMF4wXAYIKwYBBQUHMAKGUGh0dHA6Ly93d3cubWljcm9zb2Z0LmNvbS9w
# a2lvcHMvY2VydHMvTWljcm9zb2Z0JTIwVGltZS1TdGFtcCUyMFBDQSUyMDIwMTAo
# MSkuY3J0MAwGA1UdEwEB/wQCMAAwEwYDVR0lBAwwCgYIKwYBBQUHAwgwDQYJKoZI
# hvcNAQELBQADggIBADaoupxm30eKQgdyPsCWceGOi7FKM54FpMT4QrxpdxUub1wD
# wPb9ljY5Sli852G4MRX2ESVWbOimIm6T/EFiHp1YlNGGZLuFWOsa2rNIVbQt9+xH
# KyPGSm6rKEeIEPExcwZnoZ3NR+pU/Zl3Y74n8FhAmCz00djP8IzhdpE/5PZUzckT
# WZI7Wotr6Z8HjbtCIuP8kLtNRiCHhFj6gswVW5Alm9diX+MhMV9SmkmgBqQGvRVz
# avWQ/kOIlo29lYn9y5hqJZDiT3GnDrAbPeqrvEBaeUbOxrDAWGO3CrkQf+zfssJ9
# 6HK4LDxlEn1be2BIV6kBUzuxQT4+vdS76I+8FXhOxMM0UvQJUg9f7Vc4nphEZgna
# QcamgZz/myADYgpByX3tkNgkiqLGDAo1+3I3vQ7QBNulNWGxs3TUVWWLQf6+BwaH
# LOTqOkDLAc8NJD/GgR4ZTj7o8VNcxE798zMZxRx/RkepkybRSGgfy062TXyToHvk
# oldO1jdkzulN+6tK/ZCu/nPMIGLLKy04/D8gkj6T2ilOBq2sLf0vr38rDK0PTHu3
# SOZNe2Utloa+hKWN3LKvpANFWSqwJotRJKwCJZ5q/mqDrhTeYuZ56SjQT1MnnLO0
# 3+NyLOUfHReyA643qy5vcI9XsAAwyIqil1BiqI9e70jG+pdPsIT9IwLalw3JMIIH
# cTCCBVmgAwIBAgITMwAAABXF52ueAptJmQAAAAAAFTANBgkqhkiG9w0BAQsFADCB
# iDELMAkGA1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1Jl
# ZG1vbmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjEyMDAGA1UEAxMp
# TWljcm9zb2Z0IFJvb3QgQ2VydGlmaWNhdGUgQXV0aG9yaXR5IDIwMTAwHhcNMjEw
# OTMwMTgyMjI1WhcNMzAwOTMwMTgzMjI1WjB8MQswCQYDVQQGEwJVUzETMBEGA1UE
# CBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9z
# b2Z0IENvcnBvcmF0aW9uMSYwJAYDVQQDEx1NaWNyb3NvZnQgVGltZS1TdGFtcCBQ
# Q0EgMjAxMDCCAiIwDQYJKoZIhvcNAQEBBQADggIPADCCAgoCggIBAOThpkzntHIh
# C3miy9ckeb0O1YLT/e6cBwfSqWxOdcjKNVf2AX9sSuDivbk+F2Az/1xPx2b3lVNx
# WuJ+Slr+uDZnhUYjDLWNE893MsAQGOhgfWpSg0S3po5GawcU88V29YZQ3MFEyHFc
# UTE3oAo4bo3t1w/YJlN8OWECesSq/XJprx2rrPY2vjUmZNqYO7oaezOtgFt+jBAc
# nVL+tuhiJdxqD89d9P6OU8/W7IVWTe/dvI2k45GPsjksUZzpcGkNyjYtcI4xyDUo
# veO0hyTD4MmPfrVUj9z6BVWYbWg7mka97aSueik3rMvrg0XnRm7KMtXAhjBcTyzi
# YrLNueKNiOSWrAFKu75xqRdbZ2De+JKRHh09/SDPc31BmkZ1zcRfNN0Sidb9pSB9
# fvzZnkXftnIv231fgLrbqn427DZM9ituqBJR6L8FA6PRc6ZNN3SUHDSCD/AQ8rdH
# GO2n6Jl8P0zbr17C89XYcz1DTsEzOUyOArxCaC4Q6oRRRuLRvWoYWmEBc8pnol7X
# KHYC4jMYctenIPDC+hIK12NvDMk2ZItboKaDIV1fMHSRlJTYuVD5C4lh8zYGNRiE
# R9vcG9H9stQcxWv2XFJRXRLbJbqvUAV6bMURHXLvjflSxIUXk8A8FdsaN8cIFRg/
# eKtFtvUeh17aj54WcmnGrnu3tz5q4i6tAgMBAAGjggHdMIIB2TASBgkrBgEEAYI3
# FQEEBQIDAQABMCMGCSsGAQQBgjcVAgQWBBQqp1L+ZMSavoKRPEY1Kc8Q/y8E7jAd
# BgNVHQ4EFgQUn6cVXQBeYl2D9OXSZacbUzUZ6XIwXAYDVR0gBFUwUzBRBgwrBgEE
# AYI3TIN9AQEwQTA/BggrBgEFBQcCARYzaHR0cDovL3d3dy5taWNyb3NvZnQuY29t
# L3BraW9wcy9Eb2NzL1JlcG9zaXRvcnkuaHRtMBMGA1UdJQQMMAoGCCsGAQUFBwMI
# MBkGCSsGAQQBgjcUAgQMHgoAUwB1AGIAQwBBMAsGA1UdDwQEAwIBhjAPBgNVHRMB
# Af8EBTADAQH/MB8GA1UdIwQYMBaAFNX2VsuP6KJcYmjRPZSQW9fOmhjEMFYGA1Ud
# HwRPME0wS6BJoEeGRWh0dHA6Ly9jcmwubWljcm9zb2Z0LmNvbS9wa2kvY3JsL3By
# b2R1Y3RzL01pY1Jvb0NlckF1dF8yMDEwLTA2LTIzLmNybDBaBggrBgEFBQcBAQRO
# MEwwSgYIKwYBBQUHMAKGPmh0dHA6Ly93d3cubWljcm9zb2Z0LmNvbS9wa2kvY2Vy
# dHMvTWljUm9vQ2VyQXV0XzIwMTAtMDYtMjMuY3J0MA0GCSqGSIb3DQEBCwUAA4IC
# AQCdVX38Kq3hLB9nATEkW+Geckv8qW/qXBS2Pk5HZHixBpOXPTEztTnXwnE2P9pk
# bHzQdTltuw8x5MKP+2zRoZQYIu7pZmc6U03dmLq2HnjYNi6cqYJWAAOwBb6J6Gng
# ugnue99qb74py27YP0h1AdkY3m2CDPVtI1TkeFN1JFe53Z/zjj3G82jfZfakVqr3
# lbYoVSfQJL1AoL8ZthISEV09J+BAljis9/kpicO8F7BUhUKz/AyeixmJ5/ALaoHC
# gRlCGVJ1ijbCHcNhcy4sa3tuPywJeBTpkbKpW99Jo3QMvOyRgNI95ko+ZjtPu4b6
# MhrZlvSP9pEB9s7GdP32THJvEKt1MMU0sHrYUP4KWN1APMdUbZ1jdEgssU5HLcEU
# BHG/ZPkkvnNtyo4JvbMBV0lUZNlz138eW0QBjloZkWsNn6Qo3GcZKCS6OEuabvsh
# VGtqRRFHqfG3rsjoiV5PndLQTHa1V1QJsWkBRH58oWFsc/4Ku+xBZj1p/cvBQUl+
# fpO+y/g75LcVv7TOPqUxUYS8vwLBgqJ7Fx0ViY1w/ue10CgaiQuPNtq6TPmb/wrp
# NPgkNWcr4A245oyZ1uEi6vAnQj0llOZ0dFtq0Z4+7X6gMTN9vMvpe784cETRkPHI
# qzqKOghif9lwY1NNje6CbaUFEMFxBmoQtB1VM1izoXBm8qGCAsswggI0AgEBMIH4
# oYHQpIHNMIHKMQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4G
# A1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMSUw
# IwYDVQQLExxNaWNyb3NvZnQgQW1lcmljYSBPcGVyYXRpb25zMSYwJAYDVQQLEx1U
# aGFsZXMgVFNTIEVTTjozRTdBLUUzNTktQTI1RDElMCMGA1UEAxMcTWljcm9zb2Z0
# IFRpbWUtU3RhbXAgU2VydmljZaIjCgEBMAcGBSsOAwIaAxUAfemLy/4eAZuNVCzg
# bfp1HFYG3Q6ggYMwgYCkfjB8MQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGlu
# Z3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBv
# cmF0aW9uMSYwJAYDVQQDEx1NaWNyb3NvZnQgVGltZS1TdGFtcCBQQ0EgMjAxMDAN
# BgkqhkiG9w0BAQUFAAIFAOcfcBcwIhgPMjAyMjExMTYyMjIwMDdaGA8yMDIyMTEx
# NzIyMjAwN1owdDA6BgorBgEEAYRZCgQBMSwwKjAKAgUA5x9wFwIBADAHAgEAAgIO
# ADAHAgEAAgIR8DAKAgUA5yDBlwIBADA2BgorBgEEAYRZCgQCMSgwJjAMBgorBgEE
# AYRZCgMCoAowCAIBAAIDB6EgoQowCAIBAAIDAYagMA0GCSqGSIb3DQEBBQUAA4GB
# AD9RZrC11mM/DhdxevMOXX30drKEcOEtrvb8/VEyD23dcFOfrMbJ3KKfpWtUq85B
# KX+lgwP/BMkw33Yy7mK0bXWq3V7UvGg+pP5eLOSDMK1jhWsyQZORQxs9+U8T4AWY
# q5xCpC3iip0WyAVIRirWohOWimDUO2NstyNWyafX2CldMYIEDTCCBAkCAQEwgZMw
# fDELMAkGA1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1Jl
# ZG1vbmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjEmMCQGA1UEAxMd
# TWljcm9zb2Z0IFRpbWUtU3RhbXAgUENBIDIwMTACEzMAAAHJ+tWOJSB0Al4AAQAA
# AckwDQYJYIZIAWUDBAIBBQCgggFKMBoGCSqGSIb3DQEJAzENBgsqhkiG9w0BCRAB
# BDAvBgkqhkiG9w0BCQQxIgQgPlDNC1sFwf6567q+mybRlMQm3jDA2JXTheoR31bp
# gi8wgfoGCyqGSIb3DQEJEAIvMYHqMIHnMIHkMIG9BCCBdc5/Ut1RSxAneCnYf2AN
# IyGJAP/NfeFdfOHZOXb9gTCBmDCBgKR+MHwxCzAJBgNVBAYTAlVTMRMwEQYDVQQI
# EwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNyb3Nv
# ZnQgQ29ycG9yYXRpb24xJjAkBgNVBAMTHU1pY3Jvc29mdCBUaW1lLVN0YW1wIFBD
# QSAyMDEwAhMzAAAByfrVjiUgdAJeAAEAAAHJMCIEIC1VwSnxOQJ5wJ8IUvj0408e
# I1QWTPApbHM4WkNhxFAqMA0GCSqGSIb3DQEBCwUABIICADSPrsFrBCynUeCjpp2h
# VQ/bgpVkf1UdfR8WcG0YRMyyx9SxQB+dLGvbfsGiQMesfXj4f7+vO6yf6F1J/pn9
# NfOTIS+cYkMx9vR3MwsWxct1TKqJwuShECY+9jiBUZlxsjAPe22+ckmZ8On7FTHt
# iQ7FOXX29NWTOl5qDnmVQxNwgtSmEpeZv+kuLpUW+ipnNRWMo49pV7hjC6NBdIYz
# kFBOXPwHhNPnUrKpfEnHpSeAIbBfwYkmk7CdBIrTmQa28eCdH4wGcn9tk1NHf8wS
# cFybeI0MWj2i9KDEfpGhbM+etok++sPtwP10Ar7XsN9Ouq+sl8j/Ylf/xu3Yh6ZJ
# R3H9FIJZ7kDtQzAP8ij18Gokw2A3Ik3RT75YIfIuATnebfOgxqH78GIPSC9Q7s+N
# ldYX2/5xuGKsdAHDV7AH0toZHgeGs8m1fOE2j5F90aS6lQ2vgtPolVmyfSVPlU3e
# DQXu9L0QOLfHpsCn0m542gK833WTqrV1bWjK8sO9H/CQjCriAo1GJTmywn2qNWQe
# bR4wv0j2XAvsRnJPZ7DtTe+xw5fcjmLE/o6HVmeVQm2QWUot0kifQUqUHf9p+oil
# gPFWItcfFHR5ZkncWuYgi+/O4fS26VjiwNjhqYjUtVETw3BGtukyIjCxXBRj+Iyf
# 1bGu7Fr8MbJDOJK5XjLcfIS4
# SIG # End signature block
