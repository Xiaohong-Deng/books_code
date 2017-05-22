class Purchase < ActiveRecord::Base
  validates :name, presence: true
  validates :cost, numericality: { great_than: 0}
end
