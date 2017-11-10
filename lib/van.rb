require_relative 'docking_station'
require_relative 'garage'

# Transports Bikes and retrieves them from DockingStations
class Van
  VAN_CAPACITY = 5

  attr_reader :transported_bikes

  def initialize
    @transported_bikes = []
  end

  def retrieve_bike(num_bikes, source)
    raise 'Van is full.' if full?
    # case source
    # when docking_station
    bikes = source.request_repair(num_bikes)
    # else
    #   bike = source.send_back
    # end
    @transported_bikes += bikes
  end

  def deliver_bike(num_bikes, destination)
    bikes = @transported_bikes.pop(num_bikes)
    destination.accept_to_fix(bikes)
  end

  private

  def full?
    @transported_bikes.size >= VAN_CAPACITY
  end
end
