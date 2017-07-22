class Comment < ActiveRecord::Base
  belongs_to :ticket
  belongs_to :author, class_name: "User"
  belongs_to :state

  validates :text, presence: true

  # if you call project on comment, it will pass the message
  # to comment.ticket and call ticket.project instead
  delegate :project, to: :ticket
  # seems like the method defined by scope is defaulted to class method
  # judging by where.not's default self
  scope :persisted, lambda { where.not(id:nil) }

  after_create :set_ticket_state

  private
    def set_ticket_state
      ticket.state = state
      ticket.save!
    end
end
