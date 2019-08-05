#
# Манифест модуля для модуля "PSGet_RedirectConsoleAppOutput".
#
# Создано: Dr. L. S. Dee
#
# Дата создания: 05.08.2019
#

@{

# Файл модуля сценария или двоичного модуля, связанный с этим манифестом.
RootModule = 'RedirectConsoleAppOutput.psm1'

# Номер версии данного модуля.
ModuleVersion = '0.0.0.4'

# Поддерживаемые выпуски PSEditions
# CompatiblePSEditions = @()

# Уникальный идентификатор данного модуля
GUID = 'a5d4d834-cb7c-4293-843f-a00d0120c3ed'

# Автор данного модуля
Author = 'Dr. L. S. Dee'

# Компания, создавшая данный модуль, или его поставщик
CompanyName = 'Неизвестно'

# Заявление об авторских правах на модуль
Copyright = 'Dr. L. S. Dee'

# Описание функций данного модуля
Description = 'The RedirectConsoleAppOutput module allows to redirect standard output and standard error of Windows console application as an object in memory. That is its diference from the Start-Process cmdlet which redirects output to file only. If redirecting output to file is enough for your purposes, you don''t need this module.

The module exports two functions: Set-ConsoleAppStartupParameters and Start-ConsoleAppRedirectOutput.

The first function, Set-ConsoleAppStartupParameters, creates an object with set of parameters for the process.
To specify the program that runs in the process, enter full path to the executable file or path to folder containing the executable file and the name of the executable file.
You can also use remaining parameters of Set-ConsoleAppStartupParameters to specify command line arguments, working directory and encoding for output.

The second function, Start-ConsoleAppRedirectOutput, starts the process and returns the output as an array of strings.
You can specify command line arguments for application here or override them if they were specified earlier. You also may select an output type between standard output, standard errors or select both. And you may skip empty strings in the output or not (if you need it for some reason).
The array of strings returned from Start-ConsoleAppRedirectOutput can be parsed and used to create a new command line argument string for the same (or any other) console application.'

# Минимальный номер версии обработчика Windows PowerShell, необходимой для работы данного модуля
PowerShellVersion = '3.0'

# Имя узла Windows PowerShell, необходимого для работы данного модуля
# PowerShellHostName = ''

# Минимальный номер версии узла Windows PowerShell, необходимой для работы данного модуля
PowerShellHostVersion = '3.0'

# Минимальный номер версии Microsoft .NET Framework, необходимой для данного модуля. Это обязательное требование действительно только для выпуска PowerShell, предназначенного для компьютеров.
# DotNetFrameworkVersion = ''

# Минимальный номер версии среды CLR (общеязыковой среды выполнения), необходимой для работы данного модуля. Это обязательное требование действительно только для выпуска PowerShell, предназначенного для компьютеров.
# CLRVersion = ''

# Архитектура процессора (нет, X86, AMD64), необходимая для этого модуля
# ProcessorArchitecture = ''

# Модули, которые необходимо импортировать в глобальную среду перед импортированием данного модуля
# RequiredModules = @()

# Сборки, которые должны быть загружены перед импортированием данного модуля
# RequiredAssemblies = @()

# Файлы сценария (PS1), которые запускаются в среде вызывающей стороны перед импортом данного модуля.
# ScriptsToProcess = @()

# Файлы типа (.ps1xml), которые загружаются при импорте данного модуля
# TypesToProcess = @()

# Файлы формата (PS1XML-файлы), которые загружаются при импорте данного модуля
# FormatsToProcess = @()

# Модули для импорта в качестве вложенных модулей модуля, указанного в параметре RootModule/ModuleToProcess
# NestedModules = @()

# В целях обеспечения оптимальной производительности функции для экспорта из этого модуля не используют подстановочные знаки и не удаляют запись. Используйте пустой массив, если нет функций для экспорта.
FunctionsToExport = '*'

# В целях обеспечения оптимальной производительности командлеты для экспорта из этого модуля не используют подстановочные знаки и не удаляют запись. Используйте пустой массив, если нет командлетов для экспорта.
CmdletsToExport = @()

# Переменные для экспорта из данного модуля
VariablesToExport = '*'

# В целях обеспечения оптимальной производительности псевдонимы для экспорта из этого модуля не используют подстановочные знаки и не удаляют запись. Используйте пустой массив, если нет псевдонимов для экспорта.
AliasesToExport = @()

# Ресурсы DSC для экспорта из этого модуля
# DscResourcesToExport = @()

# Список всех модулей, входящих в пакет данного модуля
# ModuleList = @()

# Список всех файлов, входящих в пакет данного модуля
FileList = 'RedirectConsoleAppOutput.psd1', 'RedirectConsoleAppOutput.psm1'

# Личные данные для передачи в модуль, указанный в параметре RootModule/ModuleToProcess. Он также может содержать хэш-таблицу PSData с дополнительными метаданными модуля, которые используются в PowerShell.
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

# Код URI для HelpInfo данного модуля
# HelpInfoURI = ''

# Префикс по умолчанию для команд, экспортированных из этого модуля. Переопределите префикс по умолчанию с помощью команды Import-Module -Prefix.
# DefaultCommandPrefix = ''

}

