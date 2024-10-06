# TI MSP430FR2355 Launchpad Example

Download compiler and MSP430Ware to tools folder to build docker container

Download TI CCS installer for Linux to the tools directory
https://dr-download.ti.com/software-development/ide-configuration-compiler-or-debugger/MD-J1VdearkvK/12.8.1/CCS12.8.1.00005_web_linux-x64.tar.gz

Compiler
```
wget https://dr-download.ti.com/software-development/ide-configuration-compiler-or-debugger/MD-p4jWEYpR8n/21.6.1.LTS/ti_cgt_msp430_21.6.1.LTS_linux-x64_installer.bin

```

MSP430Ware requires export compliance
MSP430-SDK
https://dr-download.ti.com/secure/software-development/software-development-kit-sdk/MD-L2UkJRAuzb/3.80.14.01/MSP430Ware_3_80_14_01_setup.run

## Build Docker
```
docker build -t msp430-builder .
```

## Using the container in a terminal
Linux
```
docker run --rm -it -v $(pwd)/..:/workspace -w /workspace msp430-builder /opt/ti/ccs/eclipse/eclipse -noSplash -data /workspace -ccs.autoImport -application com.ti.ccstudio.apps.projectBuild -ccs.projects msp430-test -ccs.configuration Debug

```

Windows (CMD shell)
```
docker run --rm -it -v %cd%\..:/workspace -w /workspace msp430-builder /opt/ti/ccs/eclipse/eclipse -noSplash -data /workspace -ccs.autoImport -application com.ti.ccstudio.apps.projectBuild -ccs.projects msp430-test -ccs.configuration Debug

```

## Build the firmware

```
/opt/ti/ccs/eclipse/eclipse -noSplash -data /workspace -application com.ti.ccstudio.apps.projectBuild -ccs.projects msp430-test -ccs.clean

/opt/ti/ccs/eclipse/eclipse -noSplash -data /workspace -application com.ti.ccstudio.apps.projectBuild -ccs.projects msp430-test -ccs.configuration Debug

/opt/ti/ccs/eclipse/eclipse -noSplash -data /workspace -ccs.autoImport -application com.ti.ccstudio.apps.projectBuild -ccs.projects msp430-test -ccs.configuration Debug
```

## Flash output firmware example

Use uniflash  https://www.ti.com/tool/UNIFLASH#downloads