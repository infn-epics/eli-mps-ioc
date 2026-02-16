#
# Project       : MPS SSRIP Device Support
# Description   : EPICS device support for SSRIP for Machine Protection System
# Authors       : Giulia Latini <Giulia Latini@lnf.infn.it>
#

epicsEnvSet("MPS_ASYNPORT", "MPS_$(MPS_ID)")
epicsEnvSet("MPS_MSGS", "MPS_$(MPS_ID)")
epicsEnvSet("MPS_POLLING", "100")

## Use the following commands for TCP/IP
## drvAsynIPPortConfigure(const char *portName,
##                       const char *hostInfo,
##                       unsigned int priority,
##                       int noAutoConnect,
##                       int noProcessEos);
drvAsynIPPortConfigure("$(MPS_ASYNPORT)","$(MPS_TCP_IP):$(MPS_TCP_PORT)",0,0,1)

## modbusInterposeConfig(const char *portName,
##                      modbusLinkType linkType,
##                      int timeoutMsec, 
##                      int writeDelayMsec)
modbusInterposeConfig("$(MPS_ASYNPORT)", 0, 2000, 0)

## ModBus function types
## 16-bit word access 	Read Input Registers 4
## 16-bit word access 	Read Holding Registers 	3
## 16-bit word access 	Write Single Register 	6

## ModBus types
## 0 	UINT16 	
## 1 	INT16SM 	
## 2 	BCD_UNSIGNED 
## 3 	BCD_SIGNED 	
## 4 	INT16
## 5 	INT32_LE
## 6 	INT32_BE
## 7 	FLOAT32_LE
## 8 	FLOAT32_BE
## 9 	FLOAT64_LE
## 10 	FLOAT64_BE

## drvModbusAsynConfigure(portName, 
##                       tcpPortName,
##                       slaveAddress, 
##                       modbusFunction, 
##                       modbusStartAddress, 
##                       modbusLength,
##                       dataType,
##                       pollMsec, 
##                       plcType);
## drvModbusAsynConfigure("$(RFMOD_ASYNPORT)_", "$(RFMOD_ASYNPORT)", $(RFMOD_SLAVE_ADDR), function type, offset, length, dataType, 100, "SCN_RFMod")

drvModbusAsynConfigure("$(MPS_ASYNPORT)_BOOT_TIMESTAMP_RB", "$(MPS_ASYNPORT)", $(MPS_SLAVE_ADDR), 3, 0, 2, 6, $(MPS_POLLING), $(MPS_MSGS))
drvModbusAsynConfigure("$(MPS_ASYNPORT)_BENCHMARK_RB", "$(MPS_ASYNPORT)", $(MPS_SLAVE_ADDR), 3, 2, 1, 0, $(MPS_POLLING), $(MPS_MSGS))
drvModbusAsynConfigure("$(MPS_ASYNPORT)_TEMP_RB", "$(MPS_ASYNPORT)", $(MPS_SLAVE_ADDR), 3, 3, 1, 0, $(MPS_POLLING), $(MPS_MSGS))
drvModbusAsynConfigure("$(MPS_ASYNPORT)_WATCHDOG_RB", "$(MPS_ASYNPORT)", $(MPS_SLAVE_ADDR), 3, 8, 2, 6, $(MPS_POLLING), $(MPS_MSGS))
drvModbusAsynConfigure("$(MPS_ASYNPORT)_SLEEP_RB", "$(MPS_ASYNPORT)", $(MPS_SLAVE_ADDR), 3, 5, 1, 0, $(MPS_POLLING), $(MPS_MSGS))
drvModbusAsynConfigure("$(MPS_ASYNPORT)_RESET_SP", "$(MPS_ASYNPORT)", $(MPS_SLAVE_ADDR), 6, 1000, 1, 0, $(MPS_POLLING), $(MPS_MSGS))

drvModbusAsynConfigure("$(MPS_ASYNPORT)_ACK_SP", "$(MPS_ASYNPORT)", $(MPS_SLAVE_ADDR), 6, 500, 1, 0, $(MPS_POLLING), $(MPS_MSGS))
drvModbusAsynConfigure("$(MPS_ASYNPORT)_ENABLE_RB", "$(MPS_ASYNPORT)", $(MPS_SLAVE_ADDR), 3, 600, 1, 0, $(MPS_POLLING), $(MPS_MSGS))

drvModbusAsynConfigure("$(MPS_ASYNPORT)_BYPASS_VAC_COR_SP", "$(MPS_ASYNPORT)", $(MPS_SLAVE_ADDR), 6, 200, 2, 0, $(MPS_POLLING), $(MPS_MSGS))
drvModbusAsynConfigure("$(MPS_ASYNPORT)_BYPASS_VAC_RUF_SP", "$(MPS_ASYNPORT)", $(MPS_SLAVE_ADDR), 6, 202, 2, 0, $(MPS_POLLING), $(MPS_MSGS))
drvModbusAsynConfigure("$(MPS_ASYNPORT)_BYPASS_LLRF_SP", "$(MPS_ASYNPORT)", $(MPS_SLAVE_ADDR), 6, 210, 2, 0, $(MPS_POLLING), $(MPS_MSGS))
drvModbusAsynConfigure("$(MPS_ASYNPORT)_BYPASS_MOD_SP", "$(MPS_ASYNPORT)", $(MPS_SLAVE_ADDR), 6, 220, 2, 0, $(MPS_POLLING), $(MPS_MSGS))

drvModbusAsynConfigure("$(MPS_ASYNPORT)_VAC_COR_RB", "$(MPS_ASYNPORT)", $(MPS_SLAVE_ADDR), 3, 100, 2, 0, $(MPS_POLLING), $(MPS_MSGS))
drvModbusAsynConfigure("$(MPS_ASYNPORT)_VAC_RUF_RB", "$(MPS_ASYNPORT)", $(MPS_SLAVE_ADDR), 3, 102, 2, 0, $(MPS_POLLING), $(MPS_MSGS))
drvModbusAsynConfigure("$(MPS_ASYNPORT)_LLRF_RB", "$(MPS_ASYNPORT)", $(MPS_SLAVE_ADDR), 3, 110, 2, 0, $(MPS_POLLING), $(MPS_MSGS))
drvModbusAsynConfigure("$(MPS_ASYNPORT)_MOD_RB", "$(MPS_ASYNPORT)", $(MPS_SLAVE_ADDR), 3, 120, 2, 0, $(MPS_POLLING), $(MPS_MSGS))






