module NavbarHelper

  def navbar_active(controller)
    if controller_name.eql?(controller)
      return "text-primary font-weight-bold"
    end
  end

end