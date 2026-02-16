TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build the IOC application

PROD_IOC = ssrip-mps
# ssrip-mps.dbd will be created and installed
DBD += ssrip-mps.dbd

# ssrip-mps.dbd will be made up from these files:
ssrip-mps_DBD += base.dbd

# Include dbd files from all support applications:
#ssrip-mps_DBD += xxx.dbd
ssrip-mps_DBD += asyn.dbd
ssrip-mps_DBD += drvAsynIPPort.dbd
ssrip-mps_DBD += drvAsynSerialPort.dbd
ssrip-mps_DBD += modbusSupport.dbd

# Add all the support libraries needed by this IOC
#ssrip-mps_LIBS += xxx
ssrip-mps_LIBS += asyn
ssrip-mps_LIBS += modbus

# ssrip-mps_registerRecordDeviceDriver.cpp derives from ssrip-mps.dbd
ssrip-mps_SRCS += ssrip-mps_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
ssrip-mps_SRCS_DEFAULT += ssrip-mpsMain.cpp
ssrip-mps_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#ssrip-mps_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Finally link to the EPICS Base libraries
ssrip-mps_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

