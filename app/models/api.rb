class Api < ActiveRecord::Base
  has_many :events

  before_destroy :destroy_events

  def self.clear_apis_inactive_than(age)
    time = (Time.now - age).to_s

    Api.where('updated_at < ?', time.in_time_zone('UTC')).each do |api|
      api.destroy_events
    end

    Api.delete_all(['updated_at < ?', time.in_time_zone('UTC')])
  end

  def self.clear_apis_older_than(age)
    time = (Time.now - age).to_s

    Api.where('created_at < ?', time.in_time_zone('UTC')).each do |api|
      api.destroy_events
    end

    Api.delete_all(['created_at < ?', time.in_time_zone('UTC')])
  end

  def destroy_events
    self.events.each do |event|
      Property.delete_all('event_id = %d' % event.id)
    end
    Event.delete_all('api_id = %d' % self.id)
  end
end
