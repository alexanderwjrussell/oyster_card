class Journey

  attr_reader :entry_station, :exit_station, :journeys, :journey_log

  def initialize(entry_station = nil, exit_station = nil)
    @entry_station = entry_station
    @exit_station = exit_station
  end

  def in_journey?
    @entry_station != nil ? true : false
  end

  def journey_incomplete?
    @entry_station == nil || @exit_station == nil
  end

  def start(station)
    @entry_station = station
  end

  def finish(station)
    @exit_station = station
  end

  def reset
    @entry_station = nil
    @exit_station = nil
  end

  def complete_journey
    reset
  end

  # def calculate_fare(station1, station2)
  #   station1_zone = @entry_station.zone
  #   station2_zone = @exit_station.zone
  #   zone_change = station1_zone - station2_zone
  #   zone_change = zone_change.abs
  # end
end
