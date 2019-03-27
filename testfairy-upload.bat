
REM This is a sample script for uploading an Android APK from Windows.
REM Before running this script please install Node.js from  https://nodejs.org/en/ and run: npm install -g testfairy-uploader
REM For more information watch: https://www.youtube.com/watch?v=7wg07Q7TYbA

if defined JAVA_HOME goto foundJavaHome
echo ERROR: JAVA_HOME is not set. Please set the JAVA_HOME variable in your environment to match the echo location of your Java installation.
exit /b 1
:foundJavaHome

REM Put your TestFairy API_KEY here. Find it in your TestFairy account preferences.
SET API_KEY=aaa

REM example: SET KEYSTORE_PATH="debug.keystore"
SET KEYSTORE_PATH=aaa

REM example: SET STOREPASS="android"
SET STOREPASS=aaa

REM example: SET ALIAS="androiddebugkey"
SET ALIAS=aaaa

REM example: APK_PATH="c:/temp/small.apk"
SET APK_PATH=".apk"

testfairy-uploader --api-key=%API_KEY% --keystore=%KEYSTORE_PATH% --storepass=%STOREPASS% --alias=%ALIAS% %APK_PATH% 
echo %errorlevel%
