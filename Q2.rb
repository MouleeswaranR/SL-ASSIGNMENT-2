# Base class for all vehicles
class Vehicle
  attr_reader :fuel_percentage

  def initialize(fuel_percentage)
    @fuel_percentage = fuel_percentage
  end

  # Common behavior: check fuel level
  def fuel_status
    "Current fuel level: #{fuel_percentage}%"
  end

  # Common behavior: mileage calculation (generic)
  def mileage_info
    puts "Estimating average mileage for a generic vehicle..."
  end
end

# Derived class for Cars
class Car < Vehicle
  def service
    "Car service completed: Changed oil and rotated tires."
  end
end

# Derived class for Trucks
class Truck < Vehicle
  attr_reader :load_capacity

  def initialize(fuel_percentage, load_capacity)
    # Call parent initializer for shared attributes
    super(fuel_percentage)
    @load_capacity = load_capacity
  end

  def cargo_report
    "Truck load capacity currently: #{load_capacity} tons."
  end
end

# Example usage:
# car = Car.new(75)
# puts car.fuel_status
# puts car.service
# truck = Truck.new(60, 15)
# puts truck.fuel_status
# puts truck.cargo_report
