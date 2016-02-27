class Api < ActiveRecord::Base
  has_many :events, dependent: :delete_all
end
