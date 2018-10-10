class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :work

  validates :work_id, presence: true, uniqueness: { scope: :user_id, message: "only one vote per work per user" }

end
