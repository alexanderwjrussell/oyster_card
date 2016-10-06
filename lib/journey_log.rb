require_relative 'tracking'

class JourneyLog
  include Tracking

  attr_reader :entry_station, :exit_station, :journeys

  def initialize(entry_station = nil, exit_station = nil)
    @entry_station = entry_station
    @exit_station = exit_station
    @journeys = []
  end

  def complete_journey
    create_journey
    reset
  end

end
