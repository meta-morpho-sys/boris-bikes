# Interacts with Van class, accepts and fixes broken bikes.
class Garage
  def initialize
    @bikes_to_fix = []
  end

  def accept_to_fix(bike)
    @bikes_to_fix << bike
  end
end
