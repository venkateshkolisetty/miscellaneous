# Tcl package index file, version 1.0

if {![package vsatisfies [package present Tcl] 8.5]} {return}
package ifneeded Itcl 3.4 [list load [file join $dir .. .. bin libitcl3.4.dll] Itcl]
