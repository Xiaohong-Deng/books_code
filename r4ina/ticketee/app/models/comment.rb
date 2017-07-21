class Comment < ActiveRecord::Base
  belongs_to :ticket
  belongs_to :author, class_name: "User"

  validates :text, presence: true

  # if you call project on comment, it will pass the message
  # to comment.ticket and call ticket.project instead
  delegate :project, to: :ticket
  # seems like the method defined by scope is defaulted to class method
  # judging by where.not's default self
  scope :persisted, lambda { where.not(id:nil) }
end
