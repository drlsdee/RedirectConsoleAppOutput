# RedirectConsoleAppOutput
The **RedirectConsoleAppOutput** module allows to redirect standard output and standard error of Windows console application **as an object in memory**. That is its diference from the **Start-Process** cmdlet which redirects output to file only. If redirecting output to file is enough for your purposes, **you don't need this module**.

The module exports two functions: **Set-ConsoleAppStartupParameters** and **Start-ConsoleAppRedirectOutput**.
## Set-ConsoleAppStartupParameters
The first function, **Set-ConsoleAppStartupParameters**, creates an object with set of parameters for the process.
To specify the program that runs in the process, enter full path to the executable file or path to folder containing the executable file and the name of the executable file.

You can also use remaining parameters of **Set-ConsoleAppStartupParameters** to specify command line arguments, working directory and encoding for output.
## Set-ConsoleAppStartupParameters
The second function, **Set-ConsoleAppStartupParameters**, starts the process and returns the output as an array of strings.

You can specify command line arguments for application here or override them if they were specified earlier. You also may select an output type between standard output, standard errors or select both. And you may skip empty strings in the output or not (if you need it for some reason).

The array of strings returned from **Start-ConsoleAppRedirectOutput** can be parsed and used to create a new command line argument string for the same (or any other) console application.
