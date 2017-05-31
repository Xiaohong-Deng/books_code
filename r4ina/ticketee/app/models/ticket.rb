class Ticket < ActiveRecord::Base
  belongs_to :project
  belongs_to :author, class_name: "User"
  validates :name, presence: true
  validates :description, presence: true, length: { minimum: 10 }
  mount_uploader :attachment, AttachmentUploader
  # define a setter named attachment=, :attachment is a column of
  # Ticket. AttachmentUploader is a custom Uploader class. You mount
  # the uploader on the column. It's a subclass of CarrierWave::Uploader
end
