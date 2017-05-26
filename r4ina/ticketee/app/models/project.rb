class Project < ActiveRecord::Base
  validates :name, presence: true
  has_many :tickets, dependent: :destroy_all
end
