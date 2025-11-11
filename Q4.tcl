# sphere_volume_v2.tcl
# Calculate the volume of a sphere based on user input

# Procedure to compute sphere volume
proc calculateSphereVolume {r} {
    # Use expr for math operations
    return [expr { (4.0/3.0) * acos(-1) * ($r ** 3) }]
}

# Function to check if input is a valid number
proc isNumeric {val} {
    return [regexp {^\d+(\.\d+)?$} $val]
}

# Prompt user for the radius
puts -nonewline "Please enter the radius of the sphere: "
flush stdout
gets stdin radius

# Validate input
if {![isNumeric $radius]} {
    puts "Error: '$radius' is not a valid numeric value. Exiting program."
    exit
}

# Compute volume
set sphereVolume [calculateSphereVolume $radius]

# Display the result with formatting
puts "A sphere with radius $radius has a volume of [format %.3f $sphereVolume]."
