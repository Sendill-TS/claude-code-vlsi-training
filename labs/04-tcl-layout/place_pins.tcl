#!/usr/bin/env tclsh
# place_pins.tcl - spread pins evenly along the left edge of a cell.
#
# Usage: tclsh place_pins.tcl <pins.csv> <cell_height_um> <grid_um>
# CSV format: name,layer   (blank lines and lines starting with # are ignored)

proc snap {value grid} {
    return [expr {round($value / $grid) * $grid}]
}

proc read_pins {path} {
    set fh [open $path r]
    set pins {}
    foreach line [split [read $fh] "\n"] {
        set line [string trim $line]
        if {$line eq "" || [string index $line 0] eq "#"} {
            continue
        }
        lassign [split $line ","] name layer
        lappend pins [list [string trim $name] [string trim $layer]]
    }
    close $fh
    return $pins
}

# Returns a list of {name layer x y}, pins ordered bottom to top.
proc place_left {pins height grid} {
    set pitch [expr {double($height) / ([llength $pins] + 1)}]
    set placed {}
    set i 1
    foreach pin $pins {
        lassign $pin name layer
        lappend placed [list $name $layer 0.0 [snap [expr {$i * $pitch}] $grid]]
        incr i
    }
    return $placed
}

proc report {placed} {
    foreach pin $placed {
        lassign $pin name layer x y
        puts [format "%-8s %-4s x=%8.3f y=%8.3f" $name $layer $x $y]
    }
}

if {$argc != 3} {
    puts stderr "usage: tclsh place_pins.tcl <pins.csv> <cell_height_um> <grid_um>"
    exit 1
}
lassign $argv csv height grid
report [place_left [read_pins $csv] $height $grid]
