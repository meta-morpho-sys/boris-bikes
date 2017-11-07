require_relative 'bike'

# Interacts with Van class, accepts and fixes broken bikes.
class Garage
  attr_reader :bikes_to_fix, :fixed_bikes
  def initialize
    @bikes_to_fix = []
    @fixed_bikes = []
  end

  def accept_to_fix(bike)
    @bikes_to_fix << bike
  end

  def fix_bikes(num = 1)
    fixing = @bikes_to_fix.pop(num)
    @fixed_bikes += fixing.map(&:fix)
  end
end
