require_relative 'docking_station'
require_relative 'garage'

# Transports Bikes and retrieves them from DockingStations
class Van
  VAN_CAPACITY = 5

  attr_reader :transported_bikes

  def initialize
    @transported_bikes = []
  end

  def retrieve_from_docking_station(num_bikes, source)
    raise 'Van is full.' if full?
    bikes = source.request_repair(num_bikes)
    @transported_bikes += bikes
  end

  def retrieve_from_garage(num_bikes, source)
    raise 'Van is full.' if full?
    bikes = source.send_back(num_bikes)
    @transported_bikes += bikes
  end

  def deliver(num_bikes, destination)
    bikes = @transported_bikes.pop(num_bikes)
    destination.accept(bikes)
  end

  private

  def full?
    @transported_bikes.size >= VAN_CAPACITY
  end
end
