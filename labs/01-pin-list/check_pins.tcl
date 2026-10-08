#!/usr/bin/env tclsh
# check_pins.tcl - check a block pin list against the rules in README.md.
#
# Usage: tclsh check_pins.tcl <pins.csv>
# CSV format: name,direction,width,type,edge
#   (blank lines and lines starting with # are ignored)

# Returns a list of {line_number fields}, one entry per pin row.
proc read_rows {path} {
    set fh [open $path r]
    set rows {}
    set lineno 0
    foreach line [split [read $fh] "\n"] {
        incr lineno
        set line [string trim $line]
        if {$line eq "" || [string index $line 0] eq "#"} {
            continue
        }
        set fields {}
        foreach field [split $line ","] {
            lappend fields [string trim $field]
        }
        lappend rows [list $lineno $fields]
    }
    close $fh
    return $rows
}

# Returns a list of error messages for one row, empty if the row is clean.
proc check_row {fields} {
    if {[llength $fields] != 5} {
        return [list "expected 5 fields, found [llength $fields]"]
    }
    lassign $fields name direction width type edge
    set errors {}
    if {$direction ni {input output inout}} {
        lappend errors "$name: direction '$direction' is not input, output or inout"
    }
    if {![string is integer -strict $width] || $width < 1} {
        lappend errors "$name: width '$width' is not an integer of 1 or more"
    }
    return $errors
}

# Prints one line per error and returns the number of errors.
proc check_file {path} {
    set count 0
    foreach row [read_rows $path] {
        lassign $row lineno fields
        foreach message [check_row $fields] {
            puts "$path:$lineno: $message"
            incr count
        }
    }
    return $count
}

if {$argc != 1} {
    puts stderr "usage: tclsh check_pins.tcl <pins.csv>"
    exit 1
}
set errors [check_file [lindex $argv 0]]
if {$errors == 0} {
    puts "PASS"
} else {
    puts "FAILED with $errors errors"
    exit 1
}
