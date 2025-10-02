Common Issues
#################


Acquision does not end
==================

Using internal mode the acquisition does not end and stops 2 off the expected number of frames.

Fix:
----
Ensure the environment variable XSP3READOUT is set to 'frames' or 'passive' and not 'list'.
The old name variable 'active' is no longer supported and this will currently default to 'list' which will cause this issue.

