require 'schedule_attributes/active_record'
require 'schedule_attributes/action_view'

module ScheduleAttributes
  class Railtie < Rails::Railtie
    initializer "active_record.initialize_schedule_attributes" do
      ActiveSupport.on_load :active_record do
        class ActiveRecord::Base
          extend ScheduleAttributes::ActiveRecord::Sugar
        end
      end

      ActiveSupport.on_load :action_view do
        ActionView::Helpers::FormHelper.send :include, ScheduleAttributes::ActionViewFormHelper
        ActionView::Base.send :include, ScheduleAttributes::ActionViewFormHelper
        ActionView::Helpers::FormBuilder.send :include, ScheduleAttributes::ActionViewFormBuilder
      end
    end
  end
end
