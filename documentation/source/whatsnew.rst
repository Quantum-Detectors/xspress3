Release Notes
======================================


The latest version of the Xspress3 Epics driver is |release|

Version 3.2.9 Release Notes (Unreleased)
--------------------------------------------

New features:

- Added support for the X3X Mk2 Hardware
- Added TTL + Internal trigger mode (trigger mode 8)
- Added better control of playback control using the run_flags variable
- Added latest version of libraries (r568) to support X3X Mk2 Hardware

Changes: 

- XSP3READOUT has changed options, they now are passive, frames and list

Version 3.2.8 Release Notes (2023-December-11)
--------------------------------------------

No release notes produced for this version.



Version 3.2.7 Release Notes (2023-March-02)
--------------------------------------------

New features:

- Circular buffer mode
- Software frame advance


Bug fixes and enhancements:

- `Erase` is generally must faster, as only the most recent number of frames
  taken are erased, not the full list of available frames.  Since that will
  usually be fewer than 1000 frames, and often only 1 or 10 frames, that is
  significantly faster than erasing all (12216 or 16384) frames. Erasing will
  set that number of "recent frames" to 0, so that a second `Erase` will be
  very fast.


Version 3.2.6 Release Notes (2021-Oct-27)
------------------------------------------

New features:

- Added "Erase on Start" option, which will control whether `Erase` happens for
  each `Acquire`.
