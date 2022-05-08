set file="tmp.txt"
del /q %file%
dir /Ad /s /b *t > %file%
FOR /F %%i IN (%file%) DO rmdir /s %%i
del /q %file%