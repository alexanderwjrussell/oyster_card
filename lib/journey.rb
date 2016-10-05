require_relative 'oystercard'
require_relative 'journey_log'

class Journey

  attr_reader :in_journey, :journey_log, :entry_station, :exit_station, :oystercard

  def initialize(oystercard)
    @journey_log = oystercard.journey_log
    # @entry_station = entry_station
    # @exit_station = exit_station
  end
#
  # def start(entry_station)
  #   @entry_station = entry_station
  # end
  #
  # def end(exit_station)
  #   @exit_station = exit_station
  # end

  # def reset_journey
  #    @entry_station = nil
  #    @exit_station = nil
  # end

  # def record_journey
  #   journey_log.journey_history << {in: @entry_station, out: @exit_station}
  #   reset_journey
  # end
#
  def in_journey
    journey_log.entry_station != nil ? true : false
  end

  def incomplete_journey?
    @entry_station == nil || @exit_station == nil
  end
end
```
- start of a journey (journey started)
- end of journey (journey finished)
- status of an incomplete journey (in progress)
```
