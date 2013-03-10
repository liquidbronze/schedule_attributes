module ScheduleAttributes
  module ActionViewFormHelper
    def one_time_fields(object_name, options = {}, &block)
      hidden = object_name.repeat.to_i == 1
      content_tag :div, hiding_field_options("schedule_one_time_fields", hidden, options), &block
    end

    def repeat_fields(object_name, options = {}, &block)
      hidden = object_name.repeat.to_i != 1
      content_tag :div, hiding_field_options("schedule_repeat_fields", hidden, options), &block
    end

    def ordinal_fields(object_name, options = {}, &block)
      hidden = object_name.interval_unit == 'month' && object_name.by_day_of == 'week'
      content_tag :div, hiding_field_options("schedule_ordinal_fields", hidden, options), &block
    end

    def weekday_fields(object_name, options = {}, &block)
      hidden = false
      content_tag :div, hiding_field_options("schedule_weekday_fields", hidden, options), &block
    end

    def hiding_field_options(class_name, hidden = false, options = {})
      hidden_style = "display: none" if hidden
      options.tap do |o|
        o.merge!(style: [o[:style], hidden_style].compact.join('; '))
        o.merge!(class: [o[:class], class_name].compact.join(' '))
      end
    end

    def weekdays
      Hash[ I18n.t('date.day_names').zip(ScheduleAttributes::DAY_NAMES) ]
    end

    def ordinal_month_days
      (1..31).map { |d| [d.ordinalize, d] }
    end

    def ordinal_month_weeks
      Hash["first", 1, "second", 2, "third", 3, "fourth", 4, "last", -1]
    end
  end
end

module ScheduleAttributes
  module ActionViewFormBuilder
    def one_time_fields(options = {}, &block)
      @template.one_time_fields(@object_name, options, &block)
    end

    def repeat_fields(options = {}, &block)
      @template.repeat_fields(@object_name, options, &block)
    end

    def ordinal_fields(options = {}, &block)
      @template.ordinal_fields(@object_name, options, &block)
    end

    def weekday_fields(options = {}, &block)
      @template.weekday_fields(@object_name, options, &block)
    end
  end
end
