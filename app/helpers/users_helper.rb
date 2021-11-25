module UsersHelper
  def joined_on(user)
    user.created_at.to_s(:short)
  end

  def last_login(user)
    user.current_sign_in_at&.to_s(:short) || 'Never'
  end

  def associated_topics(user)
    if user.topics.empty?
      'None'
    else
      user.topics.map(&:name).join(', ')
    end
  end

  def associated_categories(user)
    if user.categories.empty?
      'None'
    else
      user.categories.map(&:name).join(', ')
    end
  end
end
