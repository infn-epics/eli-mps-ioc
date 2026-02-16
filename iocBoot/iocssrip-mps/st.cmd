#!../../bin/linux-x86_64/ssrip-mps

< envPaths

cd "${TOP}"

## Register all support components
dbLoadDatabase "dbd/ssrip-mps.dbd"
ssrip_mps_registerRecordDeviceDriver pdbbase

## Singularity CG-MPS-A-002 configuration
epicsEnvSet("MPS_ID", "MPS_A") # MPS IOC-wide unique ID
epicsEnvSet("MPS_SLAVE_ADDR", "1") # Modbus slave ID
epicsEnvSet("MPS_TCP_IP", "10.16.4.230") # MOXA IP address
epicsEnvSet("MPS_TCP_PORT", "502") # Modbus IP port
epicsEnvSet("PREFIX", "RUF-MPS-A-001") # Record name prefix
< "${TOP}/iocBoot/${IOC}/ssrip-mps.cmd"
dbLoadRecords("db/ssrip-mps.db", "MPS_ASYNPORT=${MPS_ASYNPORT}, PREFIX=${PREFIX}")

cd "${TOP}/iocBoot/${IOC}"
iocInit



