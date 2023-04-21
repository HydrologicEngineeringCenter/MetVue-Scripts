::: ***GridReader.cmd***

::: This batch file is a template for the GridReader MetVue utility.
::: This template demonstrates displaying the built-in usage help documentation for this utility by:
:::    1) Setting variables
:::    2) Setting the working directory
:::    3) Setting allowable maximum heap memory
:::    4) Command-line execution of concatenated settings and the help argument for this utility

::@echo off
::: Turn off the console display of the remaining commands in this batch file.

::: Setting for variables to be expanded at execution time rather than at parse time,
::: When delayed expansion is in effect, variables may be referenced using !variable_name!
::: (in addition to the normal %variable_name% )
SETLOCAL EnableDelayedExpansion

::: Use the current directory.
::: Specifically, use the fully qualified file pathname of this batch file's location.
PUSHD %~dp0

::: Set MetVue HOME
set mvHOME=C:/bin/metvue64.v3.2.0.171

::: Setting the location of the java executable.
set java="%mvHOME%/jre/bin/java.exe"

::: Setting the allowable maximum heap memory for use by the jvm.
set memory_setting=-Xmx4096m

::: Set the default time zone for the JVM
set gmtTz=-Duser.timezone=GMT

::: Setting the classpath for running the MetVue program.
set class_path=-cp "%mvHOME%/metvue/modules/*;%mvHOME%/metvue/modules/ext/*;%mvHOME%/platform/modules/*;%mvHOME%/platform/lib/*;%APPDATA%/HEC/HEC-MetVue/3.1.0.1221/user/modules/*"

::: Setting for calling the class to perform the operation of this utility.
set main_method=hec/metvue/base/tin/spatialUtil/GridReader

::: Setting the arguments for this utility.  
::: Use -? to refer to the built-in usage help to select from all the available arguments for this utility.
set usage_help=-?
set inFile=-inFile "xmrg/MSR_mpe_xmrg%%s:MMddyyyyHH%%z"
set controlFile=-controlFile xmrg.ctrl
set outFile=-outFile "xmrg.dss"
set tinInputInterval=-tinInputInterval "1H"
set sTime=-sTime "15JUL2017,000000"
set eTime=-eTime "18JUL2017,000000"
set prjFile=-prjFile "USA Contiguous Albers Equal Area Conic USGS_FT.prj"
set samplingMethod=-samplingMethod inverseDistSq
set writeProvider=-writeProvider DSS 
set writeType=-writeType SHG
set dssA=-dssA "A"
set dssB=-dssB "B"
set dssC=-dssC "PRECIPITATION"
set dssF=-dssF "Auld"
::: Command-line execution.
%java% %memory_setting% %gmtTz% %class_path% %main_method% !controlFile!
::: change back to original directory
POPD

ENDLOCAL

pause
