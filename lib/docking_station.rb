require_relative 'bike'

# Centralizes the process of releasing and retrieving. Handles broken bikes.
class DockingStation
  DEFAULT_CAPACITY = 20
  BROKEN_BIKES_CAPACITY = 5
  attr_accessor :capacity
  attr_reader :broken_bikes

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @working_bikes = []
    @broken_bikes = []
  end

  # Takes an array of bikes and sorts them to broken and working arrays using
  # the private `dock` method
  def accept(bikes)
    bikes.each { |b| dock(b) }
  end

  # takes an integer and returns an array of released bikes
  def release(num)
    raise 'No bikes available.' if empty?
    raise 'No working bikes available.' if @working_bikes.empty?
    @working_bikes.pop(num)
  end

  # takes an integer and returns an array of shipped bikes
  def ship(num_bikes)
    @broken_bikes.pop(num_bikes)
  end

  private

  attr_reader :working_bikes

  def dock(bike)
    raise 'Docking station is full.' if full?
    if bike.broken?
      raise 'Call the repair team.' if broken_bikes_full?
      @broken_bikes << bike
    else
      @working_bikes << bike
    end
  end

  def num_bikes
    @working_bikes.count + @broken_bikes.count
  end

  def full?
    num_bikes >= capacity
  end

  def empty?
    num_bikes.zero?
  end

  def broken_bikes_full?
    @broken_bikes.count == BROKEN_BIKES_CAPACITY
  end
end