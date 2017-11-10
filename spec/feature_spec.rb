require_relative '../lib/bike'
require_relative '../lib/docking_station'
require_relative '../lib/garage'
require_relative '../lib/van'

bike = Bike.new
broken_bike = Bike.new.report_broken
broken_bike2 = Bike.new.report_broken
ds = DockingStation.new
gar = Garage.new
van = Van.new

ds.dock(bike)
ds.dock(broken_bike)
ds.dock(broken_bike2)

van.retrieve_from_docking_station(1, ds)
van.deliver_bike(1, gar)

gar.fix_bikes
gar.send_back(1)

van.retrieve_from_garage(1, gar)
