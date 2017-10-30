require_relative 'bike'

class DockingStation
  DEFAULT_CAPACITY = 20
  BROKEN_BIKES_CAPACITY = 5
  attr_accessor :capacity, :broken_bikes

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @working_bikes = []
    @broken_bikes = []
  end

  def release_bike
    raise 'No bikes available.' if empty?
    raise 'No working bikes available.' if @working_bikes.empty?
    @working_bikes.pop
  end

  def dock(bike)
    raise 'Docking station is full.' if full?
    if bike.broken?
      if @broken_bikes.count == BROKEN_BIKES_CAPACITY
        raise 'There are five broken bikes. Call the reparation team.'
      else
      @broken_bikes << bike
      end
    else
      @working_bikes << bike
    end
  end

  private

  attr_reader :working_bikes

  def num_bikes
    @working_bikes.count + @broken_bikes.count
  end

  def full?
    num_bikes >= capacity
  end

  def empty?
    num_bikes.zero?
  end
end

