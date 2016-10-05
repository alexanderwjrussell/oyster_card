class Journey

  attr_reader :entry_station, :exit_station, :in_journey

  def initialize(entry_station = nil, exit_station = nil)
    @journey_history = []
    @entry_station = entry_station
    @exit_station = exit_station
  end

  def start(entry_station)
    @entry_station = entry_station
  end

  def end(exit_station)
    @exit_station = exit_station
  end

  def reset_journey
     @entry_station = nil
  end

  def record_journey
    @journey_history << {in: @entry_station, out: @exit_station}
    reset_journey
  end

  def in_journey
    @entry_station != nil ? true : false
  end
end