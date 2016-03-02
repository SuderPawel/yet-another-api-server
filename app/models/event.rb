class Event < ActiveRecord::Base
  belongs_to :api

  has_many :properties

  before_destroy :destroy_properties

  def params
    Property.where(event: self, name: 'action_dispatch.request.parameters').first.value
  end

  def self.clear_events_older_than(age)
    time = (Time.now - age).to_s

    Event.where('created_at < ?', time.in_time_zone('UTC')).each do |event|
      event.destroy_properties
    end

    Event.delete_all(['created_at < ?', time.in_time_zone('UTC')])
  end

  def destroy_properties
    Property.delete_all(['event_id = ?', self.id])
  end
end
