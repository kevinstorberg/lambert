module NavHelper

  def home_path?
    controller_name == 'users' && action_name == 'show'
  end

  def profile_path?
    controller_name == 'users' && action_name == 'edit' && @user == current_user
  end

  def public_pages_path?
    controller_name == 'public_pages' && PublicPage.pages.exclude?(action_name)
  end

  def users_path?
    return false if controller_name == 'users' && ['edit', 'show'].include?(action_name)
    return true  if controller_name == 'users'
  end

  def services_path?
    controller_name == 'service_areas'
  end

  def settings_path?
    controller_name == 'settings'
  end

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

  def include_footer?
    return false if controller_name == 'service_areas' && ['new', 'edit'].include?(action_name)
    return false if controller_name == 'public_pages'  && action_name == 'home'
    return true
  end
end
