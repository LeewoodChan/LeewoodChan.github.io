@echo off
echo ""> audio.yml
FOR /f "tokens=*" %%G IN ('dir /b audio') DO (
echo - name: %%G>> audio.yml
echo   link: audio\%%G>> audio.yml
)