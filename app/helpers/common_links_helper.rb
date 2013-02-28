module CommonLinksHelper

  # Helpers below are used to create very common admin area links, such as to add, edit, delete models
  # ------------------------------------------------------------------------------------------------------
      
  # Simple but dynamic link builder
  def dynamic_link_to text, path, params = {}
    link_to text, path, params
  end
  
  # Simple method to create icon buttons
  def icon_link_to text, path, icon, params = {}
    icon = icon_link(text, icon)
    link_to path, params do
      icon
    end
  end
  
  # This actually creates the content within the button including the icons
  def icon_link text, icon
    "#{content_tag(:i, '', :class => "#{icon}")} #{text}".html_safe
  end


end