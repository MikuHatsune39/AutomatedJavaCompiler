@ECHO OFF
SET /P _inputname= Please enter a name for your jar file:
echo Compileing .java
javac -d temp *.java
SET /P _inputmain= Please enter the name of your Main class file:
echo Building .jar
cd ./temp
jar cfe "%_inputname%".jar "%_inputmain%" *.class
cd ..\
echo Creating .bat file
echo @ECHO OFF > "%_inputname%".bat
echo java -jar "%_inputname%".jar >> "%_inputname%".bat
echo pause >> "%_inputname%".bat
echo Deleting .class
cd ./temp
del *.class
move *.* ..\ >nul
SET /P _inputdel= Do you want to delete your .java files from this folder? [Y/N]:
If "%_inputdel%"=="y" goto yes 
If "%_inputdel%"=="n" goto no
If "%_inputdel%"=="Y" goto yes
If "%_inputdel%"=="N" goto no
:yes
echo Deleting .java
cd ..\
del *.java
goto cont
:no
echo Please manually remove .java files before compiling another .jar
:cont
echo Done
pause
