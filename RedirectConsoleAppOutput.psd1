#
# �������� ������ ��� ������ "PSGet_RedirectConsoleAppOutput".
#
# �������: Dr. L. S. Dee
#
# ���� ��������: 05.08.2019
#

@{

# ���� ������ �������� ��� ��������� ������, ��������� � ���� ����������.
RootModule = 'RedirectConsoleAppOutput.psm1'

# ����� ������ ������� ������.
ModuleVersion = '0.0.0.4'

# �������������� ������� PSEditions
# CompatiblePSEditions = @()

# ���������� ������������� ������� ������
GUID = 'a5d4d834-cb7c-4293-843f-a00d0120c3ed'

# ����� ������� ������
Author = 'Dr. L. S. Dee'

# ��������, ��������� ������ ������, ��� ��� ���������
CompanyName = '����������'

# ��������� �� ��������� ������ �� ������
Copyright = 'Dr. L. S. Dee'

# �������� ������� ������� ������
Description = 'The RedirectConsoleAppOutput module allows to redirect standard output and standard error of Windows console application as an object in memory. That is its diference from the Start-Process cmdlet which redirects output to file only. If redirecting output to file is enough for your purposes, you don''t need this module.

The module exports two functions: Set-ConsoleAppStartupParameters and Start-ConsoleAppRedirectOutput.

The first function, Set-ConsoleAppStartupParameters, creates an object with set of parameters for the process.
To specify the program that runs in the process, enter full path to the executable file or path to folder containing the executable file and the name of the executable file.
You can also use remaining parameters of Set-ConsoleAppStartupParameters to specify command line arguments, working directory and encoding for output.

The second function, Start-ConsoleAppRedirectOutput, starts the process and returns the output as an array of strings.
You can specify command line arguments for application here or override them if they were specified earlier. You also may select an output type between standard output, standard errors or select both. And you may skip empty strings in the output or not (if you need it for some reason).
The array of strings returned from Start-ConsoleAppRedirectOutput can be parsed and used to create a new command line argument string for the same (or any other) console application.'

# ����������� ����� ������ ����������� Windows PowerShell, ����������� ��� ������ ������� ������
PowerShellVersion = '3.0'

# ��� ���� Windows PowerShell, ������������ ��� ������ ������� ������
# PowerShellHostName = ''

# ����������� ����� ������ ���� Windows PowerShell, ����������� ��� ������ ������� ������
PowerShellHostVersion = '3.0'

# ����������� ����� ������ Microsoft .NET Framework, ����������� ��� ������� ������. ��� ������������ ���������� ������������� ������ ��� ������� PowerShell, ���������������� ��� �����������.
# DotNetFrameworkVersion = ''

# ����������� ����� ������ ����� CLR (������������ ����� ����������), ����������� ��� ������ ������� ������. ��� ������������ ���������� ������������� ������ ��� ������� PowerShell, ���������������� ��� �����������.
# CLRVersion = ''

# ����������� ���������� (���, X86, AMD64), ����������� ��� ����� ������
# ProcessorArchitecture = ''

# ������, ������� ���������� ������������� � ���������� ����� ����� ��������������� ������� ������
# RequiredModules = @()

# ������, ������� ������ ���� ��������� ����� ��������������� ������� ������
# RequiredAssemblies = @()

# ����� �������� (PS1), ������� ����������� � ����� ���������� ������� ����� �������� ������� ������.
# ScriptsToProcess = @()

# ����� ���� (.ps1xml), ������� ����������� ��� ������� ������� ������
# TypesToProcess = @()

# ����� ������� (PS1XML-�����), ������� ����������� ��� ������� ������� ������
# FormatsToProcess = @()

# ������ ��� ������� � �������� ��������� ������� ������, ���������� � ��������� RootModule/ModuleToProcess
# NestedModules = @()

# � ����� ����������� ����������� ������������������ ������� ��� �������� �� ����� ������ �� ���������� �������������� ����� � �� ������� ������. ����������� ������ ������, ���� ��� ������� ��� ��������.
FunctionsToExport = '*'

# � ����� ����������� ����������� ������������������ ���������� ��� �������� �� ����� ������ �� ���������� �������������� ����� � �� ������� ������. ����������� ������ ������, ���� ��� ����������� ��� ��������.
CmdletsToExport = @()

# ���������� ��� �������� �� ������� ������
VariablesToExport = '*'

# � ����� ����������� ����������� ������������������ ���������� ��� �������� �� ����� ������ �� ���������� �������������� ����� � �� ������� ������. ����������� ������ ������, ���� ��� ����������� ��� ��������.
AliasesToExport = @()

# ������� DSC ��� �������� �� ����� ������
# DscResourcesToExport = @()

# ������ ���� �������, �������� � ����� ������� ������
# ModuleList = @()

# ������ ���� ������, �������� � ����� ������� ������
FileList = 'RedirectConsoleAppOutput.psd1', 'RedirectConsoleAppOutput.psm1'

# ������ ������ ��� �������� � ������, ��������� � ��������� RootModule/ModuleToProcess. �� ����� ����� ��������� ���-������� PSData � ��������������� ����������� ������, ������� ������������ � PowerShell.
PrivateData = @{

    PSData = @{

        # Tags applied to this module. These help with module discovery in online galleries.
        Tags = 'executable','exe','commandline','PSModule','console','output','error','errors','stderr','stdout','redirecting','RedirectStandardError','RedirectStandardOutput','process'

        # A URL to the license for this module.
        # LicenseUri = ''

        # A URL to the main website for this project.
        ProjectUri = 'https://github.com/drlsdee/RedirectConsoleAppOutput'

        # A URL to an icon representing this module.
        # IconUri = ''

        # ReleaseNotes of this module
        # ReleaseNotes = ''

        # Prerelease string of this module
        # Prerelease = ''

        # Flag to indicate whether the module requires explicit user acceptance for install/update/save
        # RequireLicenseAcceptance = $false

        # External dependent modules of this module
        # ExternalModuleDependencies = @()

    } # End of PSData hashtable

 } # End of PrivateData hashtable

# ��� URI ��� HelpInfo ������� ������
# HelpInfoURI = ''

# ������� �� ��������� ��� ������, ���������������� �� ����� ������. �������������� ������� �� ��������� � ������� ������� Import-Module -Prefix.
# DefaultCommandPrefix = ''

}

