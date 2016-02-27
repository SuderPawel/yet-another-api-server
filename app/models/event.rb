class Event < ActiveRecord::Base
  belongs_to :api

  has_many :properties, dependent: :delete_all
end
