class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :work

  validates :user, presence: true, uniqueness: { scope: :work, message: "has already voted for this work" }
  validates :work, presence: true


  def self.upvote(work, user)
    if user
      vote = Vote.new(work_id: work.id, user_id: user.id, date: Date.today)
      return vote
    end
      return nil
  end

end
