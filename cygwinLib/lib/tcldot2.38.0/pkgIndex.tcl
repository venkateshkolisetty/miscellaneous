package ifneeded Tcldot 2.38.0 "
	load [file join $dir cygtcldot.dll] Tcldot"
package ifneeded Tclpathplan 2.38.0 "
	load [file join $dir cygtclplan.dll] Tclpathplan"
package ifneeded Gdtclft 2.38.0 "
	load [file join $dir cyggdtclft.dll] Gdtclft"
package ifneeded gv 0 "
	load [file join $dir cyggv_tcl.dll] gv"
package ifneeded Tkspline 2.38.0 "
	package require Tk 8.3
	load [file join $dir cygtkspline.dll] Tkspline"
# end
