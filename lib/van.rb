class Van
  def initialize
    @transported_bikes = []
  end
  def retrieve_bike(bike)
    @transported_bikes << bike
  end
end