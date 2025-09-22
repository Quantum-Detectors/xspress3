xspress3 release notes
======================

Introduction
------------

These are the release notes for the xspress3 AreaDetector driver. This tracks
changes to the driver and underlying xspress3 library.

This file tracks changes since v3.2.8.

## __4.0.0 (Unreleased)__

### Driver

Added:

- Add support for Xspress 3 Mini Mk 2 systems
- Add TTL + internal trigger option

Changed:

- Now erase maximum out of requested frames in the next acquisition and the
  number of frames from the previous acquisition to avoid erroneous timing
  values
- Update iocDualMini_4ch IOC to use common startup files
- Now set XSP3READOUT in st.cmd to `frames` by default if not already set to
  optimise for MCA readout
- Update from bzip-devel to bzip2-devel in `build_xspress3.py`
- Update of autoconverted `.bob` screen files
- Removed symbol, adl and edl Makefiles as not used

Fixed:

- Corrected typos in DefineSCAROI.cmd when loading instances of NDTimeSeriesN
  and NDROIStatN templates
- Removed duplicate loading of req files of ROIS 10-13 in auto_settings.req
  across all IOC examples
- Removed dbpf of non-existent `$(PREFIX)det1:FrameAdvance` PV in
  `SetMainValues.cmd`

### Library

