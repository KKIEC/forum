module RolesHelper
  def associated_users(role)
    if role.users.empty?
      'None'
    else
      role.users.map(&:name).join(', ')
    end
  end
end
