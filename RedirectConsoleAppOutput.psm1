<#
.SYNOPSIS
    A simple and stupid function for timestamp with milliseconds
.DESCRIPTION
    A simple and stupid function for timestamp with milliseconds.
.EXAMPLE
    PS C:\> New-Timestamp
    Creates a string like this: '[2019-07-30 03:48:16:027]:'
.EXAMPLE
    PS C:\> Write-Verbose -Message "$(New-TimeStamp) [$($MyInvocation.MyCommand)]: Starting function `"$($MyInvocation.MyCommand)`""
    Creates a verbose message with timestamp and function name: 'VERBOSE: [2019-07-30 03:48:16:027]: Starting function "Do-SomeThing"'
.INPUTS
    None
.OUTPUTS
    [System.String]
.NOTES
    None
#>
function New-TimeStamp {
    $dateToString = (Get-Date -Format "yyyy-MM-dd hh:mm:ss:fff").ToString()
    $TimeStamp = "[$dateToString]:"
    return $TimeStamp
}

<#
.SYNOPSIS
    The function creates an object for Windows console application with startup parameters such as filename, working directory, cmdline arguments and enables redirecting of standard output and standard errors to an object in memory.
.DESCRIPTION
    The function creates an object for Windows console application with startup parameters such as filename, working directory, cmdline arguments and enables redirecting of standard output and standard errors to an object in memory.
.EXAMPLE
    PS C:\> $testExe = Set-ConsoleAppStartupParameters -FolderPath $testExeFolderPath -FileName $testExeFileName -Arguments 'help' -WorkingDirectory .\TestFolder
    No processes starts here actually. The function just creates an object [System.Diagnostics.Process]$testExe with given parameters.
.INPUTS
    [System.String]
.OUTPUTS
    [System.Diagnostics.Process]
.NOTES
    None.
#>
function Set-ConsoleAppStartupParameters {
    [CmdletBinding(DefaultParameterSetName='FullPath')]
    param (
        # Full path to executable file
        [Parameter(Mandatory=$true,
        ParameterSetName='FullPath',
        HelpMessage='Full path to executable file')]
        [string]
        $FullPath,

        # Path to folder containing executable file
        [Parameter(Mandatory=$true,
        ParameterSetName='FolderPath',
        HelpMessage='Path to folder containing executable file')]
        [string]
        $FolderPath,

        # Name of the executable file (with extension)
        [Parameter(Mandatory=$true,
        ParameterSetName='FolderPath',
        HelpMessage='Name of the executable file (with extension)')]
        [string]
        $FileName,

        # Arguments to executable (as one string!)
        [Parameter(HelpMessage='Arguments to executable (as one string!)')]
        [string]
        $Arguments,

        # Path to working directory
        [Parameter(HelpMessage='Path to working directory')]
        [string]
        $WorkingDirectory,

        # Encoding for output and error streams
        [Parameter(HelpMessage='Encoding for output and error streams')]
        [System.Text.Encoding]
        $OutEncoding = [System.Text.Encoding]::Default
    )
    
    begin {
        Write-Verbose -Message "$(New-TimeStamp) [$($MyInvocation.MyCommand)]: Starting function `"$($MyInvocation.MyCommand)`""
        if ($FullPath) {
            Write-Verbose -Message "$(New-TimeStamp) [$($MyInvocation.MyCommand)]: Full path to executable file is given: `"$FullPath`""
            [string]$FilePath = $FullPath
        } elseif ($FolderPath -and $FileName) {
            Write-Verbose -Message "$(New-TimeStamp) [$($MyInvocation.MyCommand)]: Search file `"$FileName`" in folder `"$FolderPath`""
            [string]$FilePath = Join-Path -Path $FolderPath -ChildPath $FileName
        } else {
            Write-Error -Category InvalidArgument -Message "$(New-TimeStamp) [$($MyInvocation.MyCommand)]: Path to executable file not specified!"
        }
        # Check if executable file exists:
        if (Test-Path -Path $FilePath) {
            Write-Verbose -Message "$(New-TimeStamp) [$($MyInvocation.MyCommand)]: It seems like the executable file exists. Continue..."
            # If path is relative, resolve it:
            $FilePath = Resolve-Path -Path $FilePath
        } else {
            Write-Error -Category ObjectNotFound -Message "$(New-TimeStamp) [$($MyInvocation.MyCommand)]: File not exists at path `"$FilePath`"!"
            exit
        }
        # Set working directory
        if ( -not $WorkingDirectory) {
            Write-Warning -Message "$(New-TimeStamp) [$($MyInvocation.MyCommand)]: Working directory is not set! Using current location..."
            $WorkingDirectory = (Get-Location).Path
        } elseif ( -not (Test-Path -Path $WorkingDirectory -PathType Container)) {
            Write-Error -Category ObjectNotFound -Message "$(New-TimeStamp) [$($MyInvocation.MyCommand)]: Folder not exists at path `"$WorkingDirectory`"!"
            exit
        } else {
            # Resolve full path
            $WorkingDirectory = Resolve-Path -Path $WorkingDirectory
            Write-Verbose -Message "$(New-TimeStamp) [$($MyInvocation.MyCommand)]: Folder `"$WorkingDirectory`" exists."
        }
        Write-Verbose -Message "$(New-TimeStamp) [$($MyInvocation.MyCommand)]: Working directory is set to `"$WorkingDirectory`""
        # Check cmdline arguments
        if (-not $Arguments) {
            Write-Warning -Message "$(New-TimeStamp) [$($MyInvocation.MyCommand)]: Command line arguments were not specified!"
        } else {
            # This block is needed just for information message
            if ($FilePath -match '\s+') {
                [string]$cmdPath = "`"$FilePath`""
            } else {
                [string]$cmdPath = $FilePath
            }
            [string]$cmdString = $cmdPath,  $Arguments -join ' '
            Write-Verbose -Message "$(New-TimeStamp) [$($MyInvocation.MyCommand)]: Command line arguments specified. Resulting command string is: `n$cmdString"
        }
        Write-Verbose -Message "$(New-TimeStamp) [$($MyInvocation.MyCommand)]: Codepage for output is: `"$($OutEncoding.WebName)`""
        
        $objProcess = New-Object -TypeName System.Diagnostics.Process
        $objProcessStartInfo = New-Object -TypeName System.Diagnostics.ProcessStartInfo

        $objProcessStartInfo.FileName = $FilePath
        $objProcessStartInfo.UseShellExecute = $false
        $objProcessStartInfo.WorkingDirectory = $WorkingDirectory
        $objProcessStartInfo.RedirectStandardOutput = $true
        $objProcessStartInfo.RedirectStandardError = $true
        $objProcessStartInfo.StandardOutputEncoding = $OutEncoding
        $objProcessStartInfo.StandardErrorEncoding = $OutEncoding
        $objProcessStartInfo.Arguments = $Arguments
    }
    
    process {
        $objProcess.StartInfo = $objProcessStartInfo
    }
    
    end {
        Write-Verbose -Message "$(New-TimeStamp) [$($MyInvocation.MyCommand)]: End of function `"$($MyInvocation.MyCommand)`""
        return $objProcess
    }
}

Export-ModuleMember -Function 'Set-ConsoleAppStartupParameters'

<#
.SYNOPSIS
    The function reads the output of Windows console application.
.DESCRIPTION
    The function reads the output of Windows console application.
.EXAMPLE
    PS C:\> $testStdOut = Read-ConsoleOutput -inputStream $testOut.StandardOutput
    Reads the standard output by line and puts the lines to an array.
.INPUTS
    [System.IO.StreamReader]
.OUTPUTS
    [System.Collections.Generic.List[string]]
.NOTES
    None.
#>
function Read-ConsoleOutput {
    [CmdletBinding()]
    param (
        # Input stream
        [Parameter(Mandatory)]
        [System.IO.StreamReader]
        $inputStream,

        # Skip empty strings
        [Parameter()]
        [switch]
        $SkipEmpty
    )
    
    begin {
        Write-Verbose -Message "$(New-TimeStamp) [$($MyInvocation.MyCommand)]: Starting function `"$($MyInvocation.MyCommand)`""
        Write-Verbose -Message "$(New-TimeStamp) [$($MyInvocation.MyCommand)]: Creating an output object..."
        $outputStringsList = New-Object -TypeName 'System.Collections.Generic.List[string]'
    }
    
    process {
        # Check if stream exists:
        Write-Verbose -Message "$(New-TimeStamp) [$($MyInvocation.MyCommand)]: Check if input stream exists..."
        if ($inputStream.EndOfStream) {
            Write-Warning -Message "$(New-TimeStamp) [$($MyInvocation.MyCommand)]: `"EndOfStream`" found! Exiting..."
            $outputStringsList.Add("$(New-TimeStamp) EndOfStream")
        } else {
            Write-Verbose -Message "$(New-TimeStamp) [$($MyInvocation.MyCommand)]: Input stream found. Parsing..."
            do {
                $outputLine = $inputStream.ReadLine()
                if ($outputLine) {
                    Write-Verbose -Message $outputLine
                    $outputStringsList.Add($outputLine)
                } elseif ($SkipEmpty) {
                    Write-Verbose -Message 'Empty string found. Skippping.'
                } else {
                    Write-Verbose -Message 'Empty string found. Adding to output.'
                    $outputStringsList.Add($outputLine)
                }
            } until ($inputStream.EndOfStream)
        }
    }
    
    end {
        Write-Verbose -Message "$(New-TimeStamp) [$($MyInvocation.MyCommand)]: End of function `"$($MyInvocation.MyCommand)`""
        return $outputStringsList
        $inputStream.Close()
    }
}

<#
.SYNOPSIS
    The function starts process and redirects output and errors to object.
.DESCRIPTION
    The function starts process and redirects output and errors to object.
.EXAMPLE
    PS C:\> $testExe = Set-ConsoleAppStartupParameters -exeFolderPath $testExeFolderPath -exeFileName $testExeFileName -Arguments 'help' -WorkingDirectory .\TestFolder
    PS C:\> $testOut = Start-ConsoleAppRedirectOutput -processObject $testExe -Arguments 'status -v'
    The function starts the process from the object [System.Diagnostics.Process]$testExe. Commandline arguments may be overloaded here. All outputs, both standard errors and standard output, redirecting in object [System.Management.Automation.PSCustomObject]$testOut containing two members of type [System.Collections.Generic.List[string]].
.INPUTS
    [System.Diagnostics.Process]
    [System.String]
.OUTPUTS
    [System.Management.Automation.PSCustomObject]
    [System.Collections.Generic.List[string]]
.NOTES
    None.
#>
function Start-ConsoleAppRedirectOutput {
    [CmdletBinding()]
    param (
        # Process object
        [Parameter(Mandatory=$true)]
        [System.Diagnostics.Process]
        $processObject,

        # Argument string
        [Parameter()]
        [string]
        $Arguments,

        # Type of output
        [Parameter()]
        [ValidateSet('StandardOutput','StandardError','Both')]
        [string]
        $OutputType = 'StandardOutput',

        # Skip empty strings
        [Parameter()]
        [switch]
        $SkipEmpty
    )
    
    begin {
        Write-Verbose -Message "$(New-TimeStamp) [$($MyInvocation.MyCommand)]: Starting function `"$($MyInvocation.MyCommand)`""
        if ($Arguments) {
            Write-Verbose -Message "$(New-TimeStamp) [$($MyInvocation.MyCommand)]: Given argument string is: `"$Arguments`""
            $processObject.StartInfo.Arguments = $Arguments
        } elseif ($processObject.StartInfo.Arguments) {
            Write-Verbose -Message "$(New-TimeStamp) [$($MyInvocation.MyCommand)]: Default argument string is: `"$($processObject.StartInfo.Arguments)`""
        } else {
            Write-Warning -Message "$(New-TimeStamp) [$($MyInvocation.MyCommand)]: Command line arguments were not specified! Overriding output mode to both StdOut and StdErr..."
            $OutputType = 'Both'
        }
        Write-Verbose -Message "$(New-TimeStamp) [$($MyInvocation.MyCommand)]: Output type: `"$OutputType`""
        # The variable below is used only for verbose output:
        if ($processObject.StartInfo.FileName -match '\s+') {
            [string]$cmdPath = "`"$($processObject.StartInfo.FileName)`""
            } else {
                [string]$cmdPath = $processObject.StartInfo.FileName
            }
        [string]$cmdString = $cmdPath,  $processObject.StartInfo.Arguments -join ' '
    }
    
    process {
        Write-Verbose -Message "$(New-TimeStamp) [$($MyInvocation.MyCommand)]: Starting process with arguments: `n$cmdString `nin folder: `"$($processObject.StartInfo.WorkingDirectory)`""
        $processObject.Start()
        $processAllOutput = New-Object -TypeName psobject
        switch ($OutputType) {
            'StandardOutput' {
                Write-Verbose -Message "$(New-TimeStamp) [$($MyInvocation.MyCommand)]: Creating object for StandardOutput"
                Write-Verbose -Message "$(New-TimeStamp) [$($MyInvocation.MyCommand)]: Using codepage `"$($processObject.StartInfo.StandardOutputEncoding.WebName)`""
                $processStdOutput = Read-ConsoleOutput -inputStream $processObject.StandardOutput -SkipEmpty:$SkipEmpty
                $processAllOutput | Add-Member -MemberType NoteProperty -Name 'StandardOutput' -Value $processStdOutput
            }
            'StandardError'{
                Write-Verbose -Message "$(New-TimeStamp) [$($MyInvocation.MyCommand)]: Creating object for StandardError"
                Write-Verbose -Message "$(New-TimeStamp) [$($MyInvocation.MyCommand)]: Using codepage `"$($processObject.StartInfo.StandardErrorEncoding.WebName)`""
                $processStdError = Read-ConsoleOutput -inputStream $processObject.StandardError -SkipEmpty:$SkipEmpty
                $processAllOutput | Add-Member -MemberType NoteProperty -Name 'StandardError' -Value $processStdError
            }
            'Both' {
                Write-Verbose -Message "$(New-TimeStamp) [$($MyInvocation.MyCommand)]: Creating object for StandardOutput"
                Write-Verbose -Message "$(New-TimeStamp) [$($MyInvocation.MyCommand)]: Using codepage `"$($processObject.StartInfo.StandardOutputEncoding.WebName)`""
                $processStdOutput = Read-ConsoleOutput -inputStream $processObject.StandardOutput -SkipEmpty:$SkipEmpty
                $processAllOutput | Add-Member -MemberType NoteProperty -Name 'StandardOutput' -Value $processStdOutput
                Write-Verbose -Message "$(New-TimeStamp) [$($MyInvocation.MyCommand)]: Creating object for StandardError"
                Write-Verbose -Message "$(New-TimeStamp) [$($MyInvocation.MyCommand)]: Using codepage `"$($processObject.StartInfo.StandardErrorEncoding.WebName)`""
                $processStdError = Read-ConsoleOutput -inputStream $processObject.StandardError -SkipEmpty:$SkipEmpty
                $processAllOutput | Add-Member -MemberType NoteProperty -Name 'StandardError' -Value $processStdError
            }
        }
    }
    
    end {
        Write-Verbose -Message "$(New-TimeStamp) [$($MyInvocation.MyCommand)]: End of function `"$($MyInvocation.MyCommand)`""
        return $processAllOutput
    }
}

Export-ModuleMember -Function 'Start-ConsoleAppRedirectOutput'