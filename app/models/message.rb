class Message < ApplicationRecord
  belongs_to :chatroom
  belongs_to :user
  belongs_to :pharmacy

  def sender?(a_user)
    user.id == a_user.id
  end

end
