@ECHO OFF
SETLOCAL

SET PATH=%PATH%;C:\Program Files (x86)\Git\bin

SET LOG=D:\nightly\build\build.log
SET TMPDIR=d:\nightly\build\z3
SET Z3_REPO=https://github.com/Z3Prover/z3.git
SET Z3TEST_REPO=https://github.com/Z3Prover/z3test.git
SET Z3_BIN_REPO=git@github.com:Z3Prover/bin.git
SET BRANCH=master
SET LOCAL_DISTROS=dist

SET VCVARS="D:\Program Files (x86)\Microsoft Visual Studio 11.0\VC\vcvarsall.bat"
SET DISTROS=D:\Nightly\build\bin\
SET DISTRO_SUBDIR=nightly

SET LAST_Z3_HASH=
SET LAST_Z3TEST_HASH=
SET CURRENT_Z3_HASH=
SET CURRENT_Z3TEST_HASH=

IF EXIST last_z3_hash. (
  SET /P LAST_Z3_HASH=<last_z3_hash
)

IF EXIST last_z3test_hash. (
  SET /P LAST_Z3TEST_hash=<last_z3test_hash
)

del /Q /F %LOG%

echo Last hashes: >> %LOG%
echo z3: %LAST_Z3_HASH% >> %LOG%
echo z3test: %LAST_Z3TEST_HASH% >> %LOG%

IF NOT EXIST %TMPDIR%. (
  echo Getting a new copy. >> %LOG%
  git clone %Z3_REPO% %TMPDIR% --branch %BRANCH% >> %LOG%
) ELSE (
  echo Updating existing copy. >> %LOG%
  pushd %TMPDIR%
  git pull --rebase origin %BRANCH% >> %LOG%
  popd
)

pushd %TMPDIR%
git rev-parse HEAD > tmp_z3_hash
SET /P CURRENT_Z3_HASH=<tmp_z3_hash
del /q tmp_z3_hash
popd

IF NOT EXIST z3test. (
  echo Getting a new copy of z3test. >> %LOG%
  git clone %Z3TEST_REPO% >> %LOG%
) ELSE (
  echo Updating existing copy of z3test. >> %LOG%
  pushd z3test
  git pull --rebase >> %LOG%
  popd
)

pushd z3test
git rev-parse HEAD > tmp_z3test_hash
SET /P CURRENT_Z3TEST_HASH=<tmp_z3test_hash
del /q tmp_z3test_hash
popd

echo Current hashes: >> %LOG%
echo %CURRENT_Z3_HASH% >> %LOG%
echo %CURRENT_Z3TEST_HASH% >> %LOG%

IF "%LAST_Z3_HASH%" == "%CURRENT_Z3_HASH%" (
  IF "%LAST_Z3TEST_HASH%" == "%CURRENT_Z3TEST_HASH%" (
    echo git hashes match previous version - not rebuilding. >> %LOG%
    pushd z3test
    goto :END
  )	
)

set Z3DIR=%TMPDIR%

pushd z3test
SET PYTHON=C:\Python35_x32\python.exe
call %VCVARS% x86 >> %LOG%
%PYTHON% scripts\win32test.py >> %LOG% 2>&1
IF %ERRORLEVEL% NEQ 0 goto :ERR	

echo DONE WITH W32TEST >> %LOG%

SET PYTHON=C:\Python35_x64\python.exe
call %VCVARS% x64 >> %LOG%
%PYTHON% scripts\win64test.py >> %LOG% 2>&1
IF %ERRORLEVEL% NEQ 0 goto :ERR

echo DONE WITH W64TEST >> %LOG%
popd 

pushd z3
IF EXIST %LOCAL_DISTROS%. (
  del /Q /F %LOCAL_DISTROS%\z3-*-win.zip > NUL
  del /Q /F %LOCAL_DISTROS%\z3-*-win.log > NUL
  FOR /D %%I IN (%LOCAL_DISTROS%\z3-*-*-win) DO (
    rmdir %%I /s /q
  )
) ELSE (
  mkdir %LOCAL_DISTROS%
)

rmdir build-dist /S /Q

SET PYTHON=C:\Python35_x32\python.exe
%PYTHON% scripts\mk_win_dist.py -b build-dist\%CURRENT_Z3_HASH% --githash --dotnet-key=..\secret\z3.snk>> %LOG% 2>&1
echo DONE WITH WIN_DIST >> %LOG%
IF %ERRORLEVEL% NEQ 0 goto :ERR

IF NOT EXIST build-dist\%CURRENT_Z3_HASH%\x86\z3.exe. (
  echo x86 external binary does not exist; build failed. >> %LOG%
  goto :ERR
)


IF EXIST %DISTROS%. (
  pushd %DISTROS% >> %LOG% 2>&1
  git pull --rebase -v -s recursive -Xtheirs >> %LOG% 2>&1
  popd >> %LOG% 2>&1
) ELSE (
  git clone %Z3_BIN_REPO% %DISTROS% >> %LOG% 2>&1
)

pushd %DISTROS%
git filter-branch -f --prune-empty --index-filter "git rm --cached --ignore-unmatch %DISTRO_SUBDIR%/*win.zip" HEAD 2>> %LOG% 1>NUL
git filter-branch -f --prune-empty --index-filter "git rm --cached --ignore-unmatch %DISTRO_SUBDIR%/*win.zip.log" HEAD 2>> %LOG% 1>NUL
popd

FOR %%I IN (%LOCAL_DISTROS%\z3-*-*-win.zip) DO (
  echo now at %%I
  move /Y %%I %DISTROS%\%DISTRO_SUBDIR%\%%~nxI >> %LOG% 2>&1
  copy /Y %LOG% %DISTROS%\%DISTRO_SUBDIR%\%%~nxI.log >> %LOG% 2>&1
  pushd %DISTROS%\%DISTRO_SUBDIR% >> %LOG% 2>&1  
  git add -v %%~nxI >> %LOG% 2>&1
  git add -v %%~nxI.log >> %LOG% 2>&1
  popd >> %LOG% 2>&1
)

pushd %DISTROS% >> %LOG% 2>&1
git commit -v -m "Automatic nightly build." >> %LOG% 2>&1
git push -v --force >> %LOG% 2>&1
git gc --aggressive --auto --prune=all >> %LOG% 2>&1
popd >> %LOG% 2>&1

echo ALL OK. >> %LOG% 2>&1
goto :END

:ERR
popd
exit /B 1

:END
popd
echo %CURRENT_Z3_HASH% > last_z3_hash
echo %CURRENT_Z3TEST_HASH% > last_z3test_hash
exit /B 0
