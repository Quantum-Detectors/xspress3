< envPaths
errlogInit(20000)

# PREFIX
epicsEnvSet("PREFIX", "XSP3_16Chan:")

# Number of xspress3 channels
epicsEnvSet("NUM_CHANNELS",  "16")            

# Number of xspress3 cards and IP ADDR
epicsEnvSet("XSP3CARDS", "8")
epicsEnvSet("XSP3ADDR",  "192.168.0.1")

# Max Number of Frames for data collection
# Use CIRC_BUFFER as 1 for more than 12216 frames
epicsEnvSet("CIRC_BUFFER", "1")
epicsEnvSet("MAXFRAMES", "16384")
epicsEnvSet("MAXDRIVERFRAMES", "16384")

# Number of Energy bins
epicsEnvSet("NUM_BINS",  "4096")

< ../common/DefineXSP3Driver.cmd

###############################
# DEFINE CHANNELS
#Channel 1
epicsEnvSet("CHAN",   "1")
epicsEnvSet("CHM1",   "0")
< ../common/DefineSCAROI.cmd

#Channel 2
epicsEnvSet("CHAN",   "2")
epicsEnvSet("CHM1",   "1")
< ../common/DefineSCAROI.cmd

#Channel 3
epicsEnvSet("CHAN",   "3")
epicsEnvSet("CHM1",   "2")
< ../common/DefineSCAROI.cmd

#Channel 4
epicsEnvSet("CHAN",   "4")
epicsEnvSet("CHM1",   "3")
< ../common/DefineSCAROI.cmd

#Channel 5
epicsEnvSet("CHAN",   "5")
epicsEnvSet("CHM1",   "4")
< ../common/DefineSCAROI.cmd

#Channel 6
epicsEnvSet("CHAN",   "6")
epicsEnvSet("CHM1",   "5")
< ../common/DefineSCAROI.cmd

#Channel 7
epicsEnvSet("CHAN",   "7")
epicsEnvSet("CHM1",   "6")
< ../common/DefineSCAROI.cmd

#Channel 8
epicsEnvSet("CHAN",   "8")
epicsEnvSet("CHM1",   "7")
< ../common/DefineSCAROI.cmd

#Channel 9
epicsEnvSet("CHAN",   "9")
epicsEnvSet("CHM1",   "8")
< ../common/DefineSCAROI.cmd

#Channel 10
epicsEnvSet("CHAN",   "10")
epicsEnvSet("CHM1",   "9")
< ../common/DefineSCAROI.cmd

#Channel 11
epicsEnvSet("CHAN",   "11")
epicsEnvSet("CHM1",   "10")
< ../common/DefineSCAROI.cmd

#Channel 12
epicsEnvSet("CHAN",   "12")
epicsEnvSet("CHM1",   "11")
< ../common/DefineSCAROI.cmd

#Channel 13
epicsEnvSet("CHAN",   "13")
epicsEnvSet("CHM1",   "12")
< ../common/DefineSCAROI.cmd

#Channel 14
epicsEnvSet("CHAN",   "14")
epicsEnvSet("CHM1",   "13")
< ../common/DefineSCAROI.cmd

#Channel 15
epicsEnvSet("CHAN",   "15")
epicsEnvSet("CHM1",   "14")
< ../common/DefineSCAROI.cmd

#Channel 16
epicsEnvSet("CHAN",   "16")
epicsEnvSet("CHM1",   "15")
< ../common/DefineSCAROI.cmd

###############################

dbLoadRecords("xspress3Deadtime_16Channel.template",   "P=$(PREFIX)")

< ../common/AutoSave.cmd

###############################
# start IOC
iocInit

# setup startup values

# Configure Xspress3:
# The "CONFIG_PATH" value points to the calibration folder with files:
#     card0_clocks.dat, chan1_reion0.dat, etc
# dbpf("$(PREFIX)det1:CONFIG_PATH", "/etc/xspress3/calibration/initial")
dbpf("$(PREFIX)det1:CONFIG_PATH", "$(SUPPORT)/../xspress3_settings/current/")

< ../common/SetMainValues.cmd

###############################
# SET UP CHANNELS
#Channel 1
epicsEnvSet("CHAN",   "1")
epicsEnvSet("CHM1",   "0")
< ../common/SetChannelValues.cmd

#Channel 2
epicsEnvSet("CHAN",   "2")
epicsEnvSet("CHM1",   "1")
< ../common/SetChannelValues.cmd

#Channel 3
epicsEnvSet("CHAN",   "3")
epicsEnvSet("CHM1",   "2")
< ../common/SetChannelValues.cmd

#Channel 4
epicsEnvSet("CHAN",   "4")
epicsEnvSet("CHM1",   "3")
< ../common/SetChannelValues.cmd

#Channel 5
epicsEnvSet("CHAN",   "5")
epicsEnvSet("CHM1",   "4")
< ../common/SetChannelValues.cmd

#Channel 6
epicsEnvSet("CHAN",   "6")
epicsEnvSet("CHM1",   "5")
< ../common/SetChannelValues.cmd

#Channel 7
epicsEnvSet("CHAN",   "7")
epicsEnvSet("CHM1",   "6")
< ../common/SetChannelValues.cmd

#Channel 8
epicsEnvSet("CHAN",   "8")
epicsEnvSet("CHM1",   "7")
< ../common/SetChannelValues.cmd

#Channel 9
epicsEnvSet("CHAN",   "9")
epicsEnvSet("CHM1",   "8")
< ../common/SetChannelValues.cmd

#Channel 10
epicsEnvSet("CHAN",   "10")
epicsEnvSet("CHM1",   "9")
< ../common/SetChannelValues.cmd

#Channel 11
epicsEnvSet("CHAN",   "11")
epicsEnvSet("CHM1",   "10")
< ../common/SetChannelValues.cmd

#Channel 12
epicsEnvSet("CHAN",   "12")
epicsEnvSet("CHM1",   "11")
< ../common/SetChannelValues.cmd

#Channel 13
epicsEnvSet("CHAN",   "13")
epicsEnvSet("CHM1",   "12")
< ../common/SetChannelValues.cmd

#Channel 14
epicsEnvSet("CHAN",   "14")
epicsEnvSet("CHM1",   "13")
< ../common/SetChannelValues.cmd

#Channel 15
epicsEnvSet("CHAN",   "15")
epicsEnvSet("CHM1",   "14")
< ../common/SetChannelValues.cmd

#Channel 16
epicsEnvSet("CHAN",   "16")
epicsEnvSet("CHM1",   "15")
< ../common/SetChannelValues.cmd
###############################

# save settings every thirty seconds
create_monitor_set("auto_settings.req",30,"P=$(PREFIX)")

epicsThreadSleep(5.)

# Set default event widths for deadtime correction
# note: these may be tuned for each detector:
# dbpf("$(PREFIX)C1:EventWidth",    "6")
# dbpf("$(PREFIX)C2:EventWidth",    "6")
# dbpf("$(PREFIX)C3:EventWidth",    "6")
# dbpf("$(PREFIX)C4:EventWidth",    "6")
# dbpf("$(PREFIX)C5:EventWidth",    "6")
# dbpf("$(PREFIX)C6:EventWidth",    "6")
# dbpf("$(PREFIX)C7:EventWidth",    "6")
# dbpf("$(PREFIX)C8:EventWidth",    "6")
# dbpf("$(PREFIX)C9:EventWidth",    "6")
# dbpf("$(PREFIX)C10:EventWidth",   "6")
# dbpf("$(PREFIX)C11:EventWidth",   "6")
# dbpf("$(PREFIX)C12:EventWidth",   "6")
# dbpf("$(PREFIX)C13:EventWidth",   "6")
# dbpf("$(PREFIX)C14:EventWidth",   "6")
# dbpf("$(PREFIX)C15:EventWidth",   "6")
# dbpf("$(PREFIX)C16:EventWidth",   "6")

# Xspress3 is now ready to use!
