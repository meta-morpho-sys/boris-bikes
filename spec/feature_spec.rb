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

van.retrieve(1, ds)
van.deliver(1, gar)

gar.fix_bikes
gar.ship(1)

van.retrieve(1, gar)
van.deliver(1, ds)
