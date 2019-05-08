module NavHelper

  def active_nav?(name)
    case name
    when 'about'
      return true if controller_name == 'public_pages' && action_name == 'about'
    when 'home'
      return true if controller_name == 'public_pages' && action_name == 'home'
      return true if controller_name != 'public_pages' && controller_name != 'sessions'
    when 'team'
      return true if controller_name == 'public_pages' && action_name == 'team'
    when 'signin'
      return true if controller_name == 'sessions' && action_name == 'new'
    else
      return false
    end
  end
end
