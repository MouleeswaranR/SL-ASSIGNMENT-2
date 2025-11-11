# listbox_copy_remove_v2.tcl
# Tcl/Tk program to copy items from one listbox to another and remove items from the second listbox

# Create main window
wm title . "Listbox Copy & Remove Demo"
wm geometry . 450x250

# Create two listboxes with labels
label .lbl1 -text "Available Fruits"
label .lbl2 -text "Selected Fruits"

listbox .lb1 -selectmode single -height 8 -width 20
listbox .lb2 -selectmode single -height 8 -width 20

# Layout labels and listboxes
grid .lbl1 -row 0 -column 0 -padx 10 -pady 5
grid .lbl2 -row 0 -column 1 -padx 10 -pady 5
grid .lb1 -row 1 -column 0 -padx 20 -pady 10
grid .lb2 -row 1 -column 1 -padx 20 -pady 10

# Populate the first listbox
set fruits {Apple Banana Cherry Date Grapes Mango Orange Pineapple}
foreach fruit $fruits { .lb1 insert end $fruit }

# Procedure to copy selected item from lb1 to lb2
proc copySelected {} {
    set sel [.lb1 curselection]
    if {$sel ne ""} {
        set item [.lb1 get $sel]
        # Prevent duplicate entries in lb2
        if {[lsearch [.lb2 get 0 end] $item] == -1} {
            .lb2 insert end $item
        }
    }
}

# Procedure to remove selected item from lb2
proc removeSelected {} {
    set sel [.lb2 curselection]
    if {$sel ne ""} {
        .lb2 delete $sel
    }
}

# Bind selection events
bind .lb1 <<ListboxSelect>> {copySelected}
bind .lb2 <<ListboxSelect>> {removeSelected}

# Start the Tk event loop
