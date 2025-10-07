Counting Modes for the Xspress 3
#################################

Standard Trigger Modes
==============================
Internal Triggers
-------------------

Trigger mode (1): Internal
	Utilises the internal time frame generator, therefore frame time is set by PV :ref:`FrameTime <Frame Time>`.
	

Hardware Triggers
-------------------

Trigger mode (3): TTL Veto Only
	A TTL signal can be sent to the xspress 3 system via the TTL IN 1 connection. When the signal goes high the frame will start and when the signal goes low the signal will stop.


Software Triggers
-------------------

Trigger mode (2): Software
	Frames can be controlled with the PV 'SoftTrigger'. Setting 1 to start the frame and 0 to stop the frame and ready the system for the next frame.


Combination Trigger Modes
==============================

Hardware + Internal
--------------------
Trigger mode (8): TTL + Internal:
	A TTL signal can be sent to the xspress 3 system via the TTL IN 0 connection. The end of the frame is controller by the internal time frame generator.
	Therefore every frame will be of the same length determined by the PV "AcquireTime".


Software + Internal
--------------------
Trigger mode (7): Software + Internal
	Frames can be controlled with the PV 'SoftTrigger'. Setting 1 to start the frame and 0 to ready the system for the next frame. In this mode the frame time is configured by the PV "AcquireTime". Therefore every frame will be of the same length