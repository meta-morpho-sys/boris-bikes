require_relative 'bike'

# Interacts with Van class, accepts and fixes broken bikes.
class Garage
  attr_reader :bikes_to_fix, :fixed_bikes
  def initialize
    @bikes_to_fix = []
    @fixed_bikes = []
  end

  # Accepts an array of bikes to fix
  def accept(bikes)
    @bikes_to_fix += bikes
  end

  # Accepts an array of bikes
  # Calls the #fix of Bike to change the bike state from broken to working.
  def fix_bikes(num = 1)
    fixing = @bikes_to_fix.pop(num)
    @fixed_bikes += fixing.map(&:fix)
  end

  def ship(num_bikes)
    @fixed_bikes.pop(num_bikes)
  end
end
