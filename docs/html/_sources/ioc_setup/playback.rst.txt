Using Playback Mode with Xspress 3
===================================

The Xspress 3 driver supports a playback mode, which allows previously acquired data to be replayed.
This is intended to be used for testing and development purposes of downstream applications, as it allows users to simulate data acquisition without needing to have the actual detector connected.

.. note::

  Playback will have to be loaded during the calibration process and the settings saved. You may want to have a sperate folder for these settings to avoid conflicts during actual experiments.


Generating Playback settings
----------------------------

When using the autocalibration application there is an option to load playback data. 

1. Opening advanced calibration then going to the calibration tab
2. Navigate to 'Playback Data' at the bottom
3. Select the file to load from the drop down list. These files are in /etc/xspress3/calibration/initial/playback
4. Click 'Load'
5. Wait until the status bar indicates the playback data is loaded
6. Click 'Save Settings' to save the playback data to the Xspress 3 hardware
7. Copy these settings files from /etc/xspress3/calibration/initial/settings to a new folder to avoid overwriting them during future calibrations.
8. Close the calibration application.

.. note::

  Using a similar process you can save playback data into this folder from your live data.


Using Playback Mode
--------------------

This is controlled with the run_flags variable 0 for 'adc' mode and 1 for 'playback' mode.

This variable is set in the file ~/epics/xspress3/iocs/xspress3IOC/iocBoot/common/SetMainValues.cmd