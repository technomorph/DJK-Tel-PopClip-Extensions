use AppleScript version "2.4" -- Yosemite (10.10) or later
	html: <p>option and control</p>
	mods: 786432
	-- option and control 786753 THIS IS INCLUDING XTRA MODINFO SUCH AS KEYBOARD SIDE
*)
	set sourceText to "{popclip text}"
	set modFlags to "{popclip modifier flags}"
	set modFlags to 786753
*)
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
checked_Quality"
")
	
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