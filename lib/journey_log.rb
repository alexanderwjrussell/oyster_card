class JourneyLog < Journey

  attr_reader :entry_station, :exit_station, :journeys

  def initialize(entry_station = nil, exit_station = nil)
    @entry_station = entry_station
    @exit_station = exit_station
    @journeys = []
  end

  def create_journey
    @journeys << { entry_station: @entry_station, exit_station: @exit_station }
  end

  def complete_journey
    create_journey
    reset
  end

end
