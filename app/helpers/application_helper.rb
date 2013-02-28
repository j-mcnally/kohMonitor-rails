module ApplicationHelper
  
  def conditional_html( lang = "en", &block )
    haml_concat Haml::Util::html_safe <<-"HTML".gsub( /^\s+/, '' )
      <!--[if lt IE 7 ]><html lang="#{lang}" class="no-js ie6" > <![endif]-->
      <!--[if IE 7 ]><html lang="#{lang}" class="no-js ie7" > <![endif]-->
      <!--[if IE 8 ]><html lang="#{lang}" class="no-js ie8" > <![endif]-->
      <!--[if IE 9 ]><html lang="#{lang}" class="no-js ie9" > <![endif]-->
      <!--[if (gte IE 9)|!(IE)]><!--> <html lang="#{lang}" class="no-js" > <!--<![endif]-->      
    HTML
    haml_concat capture( &block ) << Haml::Util::html_safe( "\n</html>" ) if block_given?
  end
  
  
  
  
  # Flash/Alert helpers
  # ------------------------------------------------------------------------------------------------------
  
  # a robust method to display flash messages
  def flash_helper keys=[:notice, :alert, :error]
    # allow keys to be a symbol or an array of symbols
    keys = [keys] unless keys.kind_of? Array
    
    # html from each message
    html = ''
    flash.each do |key, msg|
      html = html + content_tag(:div, msg, :class => "notification #{key}") if keys.index key
    end
    html.html_safe
  end
  
  # Simple helper to build alerts
  def alert_helper text, type=success
    "#{content_tag(:div, content_tag(:h2, text), :class => "alert alert-#{type}")}".html_safe
  end
  
  
  
  
  # Some simple data and time format helpers
  # ------------------------------------------------------------------------------------------------------

  # Format date 
  def format_date date
    date.strftime('%a, %b %-d, %Y')
  end

  # Format Time
  def format_time time
    time.strftime('%I:%M %p')
  end
  
  
end
