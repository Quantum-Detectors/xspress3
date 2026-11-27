xspress3 release notes
======================

Introduction
------------

These are the release notes for the xspress3 AreaDetector driver. This tracks
changes to the driver and underlying xspress3 library.

This file tracks changes since v3.2.8.

## Unreleased

### Driver

- Now use ADC clock instead of midplane for X3X2 when only a single card is present
- setTriggerMode now only configures radial trigger if there is more than one card on
  an X3X2 system so triggering works for single Xspress 3 Mini boxes. Additional work
  is required to handle 2 Xspress 3 Mini boxes correctly.

### Library

- Updated to version r601 from 2026-11-12

  - xspress3: Changes to xspress3.c and xspress3_save_restore.c to default to sync_mode=XSP3_SYNC_MIDPLANE for x3m2 with > 1 card.
  - Changes to xspress3_clocks.c to not use the floating timestamp sync input when using a single card X3m2 
  - Xspress3mini: xsp3mp_decode_list shows padding
  - xspress3: Bug fix to xspress3_adjust_trigger_b_threshold_ringing() when data missing on a channel.
  - Xspress3: xspress3_calib_triggers.c: Fixed uninitialised variables
  - xspress3: added scale-by-rate functionality
  - Xspress4: Work on xspress3_measure_trigger_b and of event tail IIR
  - Xspress4: fine time top from stream 14
  - Xspress3/4: Servo IIR Filter
  - Xspress3/mini/4: Debugged startup of xspress4d with firmware work on I2C glitch on power-up.


## 3.3.0  2026-Jan-30

### Driver

Added:

- Add support for Xspress 3 Mini Mk 2 systems
- Add TTL + internal trigger option

Changed:

- Now erase maximum out of requested frames in the next acquisition and the
  number of frames from the previous acquisition to avoid erroneous timing
  values
- Update iocDualMini_4ch IOC to use common startup files
- Now set `XSP3READOUT` environment variable to `frames` by default
  in `st.cmd` if not already set so that readout is optimised for MCA mode
- Update from `bzip-devel` to `bzip2-devel` in `build_xspress3.py`
- Changed number of cards in ioc_<N>Channel st.cmd files based on assuming
  an Xspress 3X system with 2 channels per card (instead of 8 for the
  older Xspress 3 systems)
- Update of autoconverted `.bob` screen files
- Removed symbol, adl and edl Makefiles as not used

Fixed:

- Corrected typos in `DefineSCAROI.cmd` when loading instances of NDTimeSeriesN
  and NDROIStatN templates
- Removed duplicate loading of req files of ROIS 10-13 in `auto_settings.req`
  across all IOC examples
- Removed dbpf of non-existent `$(PREFIX)det1:FrameAdvance` PV in
  `SetMainValues.cmd`
- Correctly set the datatype for `$(P)$(R)DataType_RBV` to reflect the type of
  NDArrays the driver will produce (based on if DTC is enabled or not)
- Now sets up clocks of all cards at same time by passing `-1` to
  `clocks_setup`. Previously each card was configured individually in a loop
  in `xspress3Epics.cpp` which caused some synchronisation problems.
- Removed duplicate calls to `setupITFG()` and `histogram_start` when starting
  an acquisition
- Now explicitly set channel control registers to the desired data source (based
  on `$(PREFIX)det1:RUN_FLAGS`) between real and playback data. This fixes an
  issue where real data could not be acquired if the settings files being
  loaded include playback data.
- Fixed scalar addresses in the 16 channel XSP3.xml file
- Fixed macro in SetChannelValues.cmd to set the number of points in the time
  series to MAXFRAMES. The invalid value causes an error in EPICS R7.0.9 and
  later.

### Library

Added:

- Updated to version r568 (2024-12-19) to support Xspress 3 Mini Mk2 systems

Changed:

- ImageMod unlinking now accepts an argument to choose which modules to unlink
  when called
