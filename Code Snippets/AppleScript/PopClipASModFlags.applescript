use AppleScript version "2.4" -- Yosemite (10.10) or lateruse framework "Foundation"use framework "AppKit"(*
	Base for parsing {popclip modifier flags} 
	see NSxxxxxxxKeyMask Properties for values
	Combo Example: option and control
	from PopClip returns: 786432
	from KeyCodes returns: 786753 
			- keyCodes is different because it also includes other mask info
			     such as which keyboard side for each key
*)-- classes, constants, and enums usedproperty NSCommandKeyMask : a reference to 1048576 -- 0x100000property NSAlternateKeyMask : a reference to 524288 -- 0x80000property NSControlKeyMask : a reference to 262144 -- 0x40000property NSShiftKeyMask : a reference to 131072 -- 0x20000property hasCommand : falseproperty hasOption : falseproperty hasControl : falseproperty hasShift : falseproperty sourceText : ""property modFlags : 0-- Example Custom App Optionsproperty useBitShift : true -- set true if hasOption // default trueproperty addBitValueComment : false -- set true if hasControl // default false-- if hasShift set both above to false property firstNotZero : false -- set true if hasShift and hasCommand // default false-- Get Data from PopClipset sourceText to "{popclip text}"set modFlags to "{popclip modifier flags}"-- Testing in AppleScript without PopClip. Using example values from top --set modFlags to 786432			-- example value from PopClipset modFlags to 786753 -- example value from KeyCodes with other BitMasksmy parseKeyMaskOptions()my parseAppOptionsForFlags()my logResults()on parseKeyMaskOptions()	set hasCommand to ((modFlags div NSCommandKeyMask) mod 2) = 1	set hasOption to ((modFlags div NSAlternateKeyMask) mod 2) = 1	set hasControl to ((modFlags div NSControlKeyMask) mod 2) = 1	set hasShift to (((modFlags) div (get NSShiftKeyMask)) mod 2) = 1end parseKeyMaskOptionson parseAppOptionsForFlags()	if hasOption then set useBitShift to true	if hasControl then set addBitValueComment to true	if hasShift then		set useBitShift to false		set addBitValueComment to false		if hasCommand then set firstNotZero to true	end ifend parseAppOptionsForFlagson logResults()	log {"modFlags value is", modFlags}	log {"hasCommand is", hasCommand}	log {"hasOption is", hasOption}	log {"hasControl is", hasControl}	log {"hasShift is", hasShift}	log {"==================Custom App Options Below"}	log {"useBitShift is", useBitShift}	log {"addBitValueComment is", addBitValueComment}	log {"firstNotZero is", firstNotZero}end logResults(* RESULTS
	
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