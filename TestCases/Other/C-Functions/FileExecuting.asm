.386
include \masm32\include\masm32rt.inc

.data 
filePathSt db "steam://rungameid/1476970", 0 ; Steam URI for launching IdleOn via its game ID
openStr db "open", 0 ; The action we wish to do with the file, in this case: open.  as we wish to open the file

.code

main:

    ; Call the windows api to execute a program directly on the shell, in this case via the use of the steam api
    invoke ShellExecute, NULL, addr openStr, addr filePathSt, NULL, NULL, SW_SHOWNORMAL
   ; (HWND hwn ) = handle to parent window (can be NULL)
   ; (LPCSTR lpOperation) = operation: "open", "edit", "print", etc.
   ; (LPCSTR lpFile) = path to file or program
   ; (LPCSTR lpParameters) = command-line arguments (optional)
   ; (LPCSTR lpDirectory)   working directory (optional)
   ; (INT nShowCmd) = show window mode (like: SW_SHOWNORMAL)

end main
