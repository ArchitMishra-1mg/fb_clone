module FriendsHelper

  # returns friend relation of id1 and id2
  def friendship_accepted(id1, id2)
    f1 = Friend.find_by(user_id: id1, friend_id: id2, status: :accepted)
    f2 = Friend.find_by(user_id: id2, friend_id: id1, status: :accepted)
    if f1.nil?
      f2
    else
      f1
    end
  end

  # returns friend relation of id1 and id2
  def friendship_pending(id1, id2)
    f1 = Friend.find_by(user_id: id1, friend_id: id2, status: :pending)
    f2 = Friend.find_by(user_id: id2, friend_id: id1, status: :pending)
    if f1.nil?
      f2
    else
      f1
    end
  end

  def all_friends(id1)
    f1 = Friend.where('user_id = ? and status = ?', id1, 'accepted')
    f2 = Friend.where('friend_id = ? and status = ?', id1, 'accepted')
    f1 + f2
  end

  # tells if id1 & id2 are friends
  def present(id1, id2)
    f1 = Friend.find_by(user_id: id1, friend_id: id2, status: :accepted)
    f2 = Friend.find_by(user_id: id2, friend_id: id1, status: :accepted)
    (f1 || f2).nil?
  end

  def pending_req(id1)
    f1 = Friend.where('user_id = ? and status = ?', id1, 'pending')
    f2 = Friend.where('friend_id = ? and status = ?', id1, 'pending')
    f1 + f2
  end

  def friends_count(id1)
    all_friends(id1).count
  end
end
