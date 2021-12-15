module CategoriesHelper
  def created_by(user)
    return user.name if user

    'Destroyed user'
  end
end
