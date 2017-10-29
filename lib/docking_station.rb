require_relative 'bike'

class DockingStation
  DEFAULT_CAPACITY = 20
  attr_accessor :capacity

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
      @broken_bikes << bike
    else
      @working_bikes << bike
    end
  end

  private

  attr_reader :working_bikes, :broken_bikes

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
