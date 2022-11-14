use AppleScript version "2.4" -- Yosemite (10.10) or later
	Base for parsing {popclip modifier flags} 
	see NSxxxxxxxKeyMask Properties for values
	Combo Example: option and control
	from PopClip returns: 786432
	from KeyCodes returns: 786753 
			- keyCodes is different because it also includes other mask info
			     such as which keyboard side for each key
*)
	
	(*modFlags value is, 786753*)
	(*hasCommand is, false*)
	(*hasOption is, true*)
	(*hasControl is, true*)
	(*hasShift is, false*)
	(*==================Custom App Options Below*)
	(*useBitShift is, true*)
	(*addBitValueComment is, true*)
	(*firstNotZero is, false*)
	
*)