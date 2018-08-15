taskkill /IM Maven.exe /T /F
taskkill /IM TestComplete.exe /T /F

XCOPY \\daily-app\c$\build\deploys\sc_mssql\clients\Maven C:\a_Maven\Maven /I /E /R /X /Y
XCOPY \\daily-app\c$\build\deploys\sc_mssql\Tools\Publisher C:\a_Maven\Publisher /I /E /R /X /Y
XCOPY C:\a_Maven\PublishersSettings\entities C:\a_Maven\Publisher\entities /I /E /R /X /Y
Xcopy C:\a_Maven\PublishersSettings\TestData.xls C:\a_Maven\Publisher\TestData.xls /I /E /R /X /Y
Xcopy C:\a_Maven\PublishersSettings\Publisher.exe.config C:\a_Maven\Publisher\Publisher.exe.config /I /E /R /X /Y
cd C:\a_Maven\Publisher\
Publisher.exe -q
cd C:\Program Files (x86)\SmartBear\TestComplete 11\Bin\
TestComplete.exe "C:\a_Maven\a_MavenSuite\a_MavenSuite.pjs" /r /p:MavenScorto /SilentMode /ns /exit

exit /b 0