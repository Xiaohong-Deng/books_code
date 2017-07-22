class Comment < ActiveRecord::Base
  belongs_to :ticket
  belongs_to :author, class_name: "User"
  belongs_to :previous_state, class_name: "State"
  belongs_to :state

  validates :text, presence: true

  # if you call project on comment, it will pass the message
  # to comment.ticket and call ticket.project instead
  delegate :project, to: :ticket
  # seems like the method defined by scope is defaulted to class method
  # judging by where.not's default self
  scope :persisted, lambda { where.not(id:nil) }

  before_create :set_previous_state
  after_create :set_ticket_state

  private
    def set_previous_state
      self.previous_state = ticket.state
    end

    def set_ticket_state
      ticket.state = state
      ticket.save!
    end
end
