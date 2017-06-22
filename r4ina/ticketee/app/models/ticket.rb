class Ticket < ActiveRecord::Base
  belongs_to :project
  belongs_to :author, class_name: "User"
  has_many :attachments, dependent: :destroy
  # This little helper tells your model to accept attachment attributes along with ticket
  # attributes whenever you call methods like new, build, and update. It will also change
  # how fields_for performs in your form, making it reference the attachments association,
  # and calling the parameters that get generated in the form attachments_attributes rather than attachments.
  accepts_nested_attributes_for :attachments, reject_if: :all_blank
  validates :name, presence: true
  validates :description, presence: true, length: { minimum: 10 }
end
