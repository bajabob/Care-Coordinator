module NavigationHelpers

  def path_to(page_name)
    case page_name

    when /^the (Care Coordinator )home\s?page$/
      '/appointments/view'

    when /^the New Appointment page$/
      '/appointments/new'

    when /appointment/
      '/appointments/1'

    when /^the Update Appointment page$/
      '/appointments/1/edit'

    when /^the login page$/
      '/accounts/login'

    when /^the Sign Up page$/
      '/accounts/new'

    when /^the care providers page$/
      '/providers/'

    when /^the new care provider page$/
      '/providers/new'

    when /^a care provider page$/
      '/providers/1'

    when /^the edit care provider page$/
      '/providers/1/edit'
      
    else
      begin
        page_name =~ /^the (.*) page$/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue NoMethodError, ArgumentError
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)
