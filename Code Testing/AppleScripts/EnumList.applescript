use AppleScript version "2.4" -- Yosemite (10.10) or lateruse framework "Foundation"use scripting additionsuse framework "AppKit"-- classes, constants, and enums usedproperty NSString : a reference to current application's NSStringproperty NSArray : a reference to current application's NSArrayproperty NSMutableArray : a reference to current application's NSMutableArrayproperty NSCharacterSet : a reference to current application's NSCharacterSetproperty NSMutableCharacterSet : a reference to current application's NSMutableCharacterSetproperty NSRegularExpressionSearch : a reference to 1024property NSCommandKeyMask : a reference to 1048576 -- 0x100000property NSAlternateKeyMask : a reference to 524288 -- 0x80000property NSControlKeyMask : a reference to 262144 -- 0x40000property NSShiftKeyMask : a reference to 131072 -- 0x20000property hasCommand : falseproperty hasOption : falseproperty hasControl : falseproperty hasShift : falseproperty addBitValueComment : falseproperty useBitShift : trueproperty firstNotZero : falseproperty startOffset : 1property sourceLines : {}property countLines : 0property finalArray : {}property finalString : ""(*
	html: <p>option and control</p>
	mods: 786432
	-- option and control 786753 THIS IS INCLUDING XTRA MODINFO SUCH AS KEYBOARD SIDE
*)--property modFlags : 786432property modFlags : 0(*
	set sourceText to "{popclip text}"
	set modFlags to "{popclip modifier flags}"
	set modFlags to 786753
*)set sourceText to "checked_Whitespace
checked_EpisodeID
checked_CatalogNo
checked_Composer
checked_Label
checked_Rating
checked_Show
checked_Comments
checked_Genre
checked_MultiArtists
checked_Dupes
checked_Quality"set sourceText to "composer,comment,album,bitRate,duration,location,modificationDate,playedDate,playedCount"set modFlags to NSShiftKeyMaskmy parseOptionsForModFlags:modFlagsset sourceString to (NSString's stringWithString:sourceText)set sourceLines to (my splitString:sourceString)set countLines to sourceLines's |count|()if (countLines > 0) then	my parseLines()end ifif (finalArray's |count|() > 0) then	set finalString to (finalArray's componentsJoinedByString:"
")end ifif (finalString's |length|() > 0) then	tell application "System Events"		set finalText to finalString as text		delay 0.02		set the clipboard to finalText		delay 0.5		keystroke "v" using {command down}		keystroke return		delay 0.02	end tellend ifon parseLines()	set finalArray to (NSMutableArray's new())	repeat with i from 0 to (countLines - 1)		set aNewLine to (sourceLines's objectAtIndex:i)		set aSuffix to (my createSuffixForIndex:i)		set aFinalLine to (aNewLine's stringByAppendingString:aSuffix)		(finalArray's addObject:aFinalLine)	end repeatend parseLineson createSuffixForIndex:aIndex	log {"aIndex is", aIndex}	set aShift to 0	set aSuffix to (NSString's stringWithString:"")	if (useBitShift or firstNotZero) then		set aValue to (NSString's stringWithString:"")		if (useBitShift) then			if (aIndex is 0) then				set aValue to (aValue's stringByAppendingString:"0")			else				set aShift to (aIndex - 1)				log {"aShift is", aShift}				set aValue to (NSString's stringWithFormat_("1 << %@", aShift))			end if		else			set aShift to (aIndex + startOffset)			set aValue to (NSString's stringWithFormat_("%@", aShift))		end if				set aSuffix to (aSuffix's stringByAppendingFormat_(" = %@", aValue))	end if		if (aIndex is not (countLines - 1)) then		set aSuffix to (aSuffix's stringByAppendingString:",")	end if		if (addBitValueComment) then		log {"aShift for value is", aShift}		set aIntegerValue to 2 ^ aShift		if (aIndex is 0) then set aIntegerValue to 0				log {"aIntegerValue is", aIntegerValue}				set aComment to (NSString's stringWithFormat_("					\\\\ %@", aIntegerValue))		set aSuffix to (aSuffix's stringByAppendingString:aComment)	end if	return aSuffixend createSuffixForIndex:on splitString:aString	set aSplitCharSet to NSMutableCharacterSet's new()	set aNewLineSet to NSCharacterSet's newlineCharacterSet()	aSplitCharSet's formUnionWithCharacterSet:aNewLineSet	set aCommaCharSet to NSCharacterSet's characterSetWithCharactersInString:","	aSplitCharSet's formUnionWithCharacterSet:aCommaCharSet	set aSplitString to (aString's componentsSeparatedByCharactersInSet:aSplitCharSet)		set aCleanedArray to (NSMutableArray's new())	repeat with aLine in aSplitString		if ((aLine is not "") and (aLine is not missing value)) then			set aCleanLine to (my cleanAllWhiteSpaceInText:aLine)			(aCleanedArray's addObject:aCleanLine)		end if	end repeat	return aCleanedArrayend splitString:-- CLEAN WHITESPACE (ALL)on cleanAllWhiteSpaceInText:aText	set aString to (NSString's stringWithString:aText)	set aPattern to (NSString's stringWithString:"(\\s+){2}")	set aDirtyString to (aString's ¬		stringByReplacingOccurrencesOfString:aPattern withString:" " options:(NSRegularExpressionSearch) range:(current application's NSMakeRange(0, aString's |length|)))	set aCharSet to NSCharacterSet's whitespaceCharacterSet()	set aCleanString to (aDirtyString's stringByTrimmingCharactersInSet:aCharSet)	return aCleanStringend cleanAllWhiteSpaceInText:on parseOptionsForModFlags:modKeysFlags	set hasCommand to ((modFlags div NSCommandKeyMask) mod 2) = 1	set hasOption to ((modFlags div NSAlternateKeyMask) mod 2) = 1	set hasControl to ((modFlags div NSControlKeyMask) mod 2) = 1	set hasShift to (((modFlags) div (get NSShiftKeyMask)) mod 2) = 1		if hasShift then set addBitValueComment to true	if hasOption then		set useBitShift to false		set addBitValueComment to false	end if	if hasCommand then set firstNotZero to trueend parseOptionsForModFlags:(*
	
	"text: html: {popclip html}
	mods: {popclip modifier flags}
	tab:  {popclip browser title}
	url:  {popclip browser url}
	durl:  {popclip selected url}
	bid:  {popclip bundle identifier}
	wnd:  {popclip window title}
	app:  {popclip app name}
	urle: {popclip urlencoded text}
	fish: {popclip option fish}"
*)