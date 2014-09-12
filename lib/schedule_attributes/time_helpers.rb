module ScheduleAttributes
  module TimeHelpers
    def self.parse_in_zone(str)
      if Time.respond_to?(:zone) && Time.zone
        # Rails 4.1 removes Date.to_time_in_current_zone in favour of Date.in_time_zone
        if str.respond_to?(:in_time_zone)
          str.in_time_zone
        else
          str.is_a?(Date) ? str.to_time_in_current_zone : Time.zone.parse(str)
        end
      else
        str.is_a?(Time) ? str : Time.parse(str)
      end
    end

    def self.today
      if Time.respond_to?(:zone) && Time.zone
        # Rails 4.1 removes Date.to_time_in_current_zone in favour of Date.in_time_zone
        current_date = Date.current
        current_date.respond_to?(:in_time_zone) ? current_date.in_time_zone : current_date.to_time_in_current_zone
      else
        Date.today.to_time
      end
    end
  end

  module DateHelpers
    def self.today
      if Time.respond_to?(:zone) && Time.zone
        Date.current
      else
        Date.today
      end
    end
  end
end
