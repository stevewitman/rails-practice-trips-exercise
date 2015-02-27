class Trip < ActiveRecord::Base
  belongs_to :user
  validates :location, :date, :cost, presence: true
end
