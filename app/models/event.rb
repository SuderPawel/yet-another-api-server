class Event < ActiveRecord::Base
  belongs_to :api

  has_many :properties, dependent: :delete_all

  def params
    Property.where(event: self, name: 'action_dispatch.request.parameters').first.value
  end
end
