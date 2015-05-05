module ScheduleAttributes::RuleParser
  # Parse an options hash to a weekly rule
  # Weekdays used only if one or more are given, otherwise assume a weekly
  # schedule starting the day of the :start_date
  #
  class Week < Base

    private

    # @return [IceCube::Rule]
    #
    def parse_options
      @rule = IceCube::Rule.weekly(input.interval, input.week_start_day)
      @rule.day(*input.weekdays) unless input.weekdays.empty?
    end

  end
end
