
# Represents a bike that can be working or broken
class Bike
  def initialize
    @broken = false
  end

  def working?
    !broken?
  end

  def broken?
    @broken
  end

  def report_broken
    @broken = true
    self
  end

  def fix
    @broken = false
    self
  end
end
