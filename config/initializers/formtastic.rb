# encoding: utf-8

# --------------------------------------------------------------------------------------------------
# Please note: If you're subclassing Formtastic::FormBuilder, Formtastic uses
# class_attribute for these configuration attributes instead of the deprecated
# class_inheritable_attribute. The behaviour is slightly different with subclasses (especially
# around attributes with Hash or Array) values, so make sure you understand what's happening.
# See the documentation for class_attribute in ActiveSupport for more information.
# --------------------------------------------------------------------------------------------------

# Set the default text field size when input is a string. Default is nil.
# Formtastic::FormBuilder.default_text_field_size = 50

# Set the default text area height when input is a text. Default is 20.
# Formtastic::FormBuilder.default_text_area_height = 5

# Set the default text area width when input is a text. Default is nil.
# Formtastic::FormBuilder.default_text_area_width = 50

# Should all fields be considered "required" by default?
# Defaults to true.
# Formtastic::FormBuilder.all_fields_required_by_default = true

# Should select fields have a blank option/prompt by default?
# Defaults to true.
# Formtastic::FormBuilder.include_blank_for_select_by_default = true

# Set the string that will be appended to the labels/fieldsets which are required
# It accepts string or procs and the default is a localized version of
# '<abbr title="required">*</abbr>'. In other words, if you configure formtastic.required
# in your locale, it will replace the abbr title properly. But if you don't want to use
# abbr tag, you can simply give a string as below
# Formtastic::FormBuilder.required_string = "(required)"

# Set the string that will be appended to the labels/fieldsets which are optional
# Defaults to an empty string ("") and also accepts procs (see required_string above)
# Formtastic::FormBuilder.optional_string = "(optional)"

# Set the way inline errors will be displayed.
# Defaults to :sentence, valid options are :sentence, :list, :first and :none
# Formtastic::FormBuilder.inline_errors = :sentence
# Formtastic uses the following classes as default for hints, inline_errors and error list

# If you override the class here, please ensure to override it in your stylesheets as well
# Formtastic::FormBuilder.default_hint_class = "inline-hints"
# Formtastic::FormBuilder.default_inline_error_class = "inline-errors"
# Formtastic::FormBuilder.default_error_list_class = "errors"

# Set the method to call on label text to transform or format it for human-friendly
# reading when formtastic is used without object. Defaults to :humanize.
# Formtastic::FormBuilder.label_str_method = :humanize

# Set the array of methods to try calling on parent objects in :select and :radio inputs
# for the text inside each @<option>@ tag or alongside each radio @<input>@. The first method
# that is found on the object will be used.
# Defaults to ["to_label", "display_name", "full_name", "name", "title", "username", "login", "value", "to_s"]
# Formtastic::FormBuilder.collection_label_methods = [
#   "to_label", "display_name", "full_name", "name", "title", "username", "login", "value", "to_s"]

# Additionally, you can customize the order for specific types of inputs.
# This is configured on a type basis and if a type is not found it will
# fall back to the default order as defined by #inline_order
# Formtastic::FormBuilder.custom_inline_order[:checkbox] = [:errors, :hints, :input]
# Formtastic::FormBuilder.custom_inline_order[:select] = [:hints, :input, :errors]

# Specifies if labels/hints for input fields automatically be looked up using I18n.
# Default value: true. Overridden for specific fields by setting value to true,
# i.e. :label => true, or :hint => true (or opposite depending on initialized value)
# Formtastic::FormBuilder.i18n_lookups_by_default = false

# Specifies if I18n lookups of the default I18n Localizer should be cached to improve performance.
# Defaults to false.
# Formtastic::FormBuilder.i18n_cache_lookups = true

# Specifies the class to use for localization lookups. You can create your own
# class and use it instead by subclassing Formtastic::Localizer (which is the default).
# Formtastic::FormBuilder.i18n_localizer = MyOwnLocalizer

# You can add custom inputs or override parts of Formtastic by subclassing Formtastic::FormBuilder and
# specifying that class here.  Defaults to Formtastic::FormBuilder.
# Formtastic::Helpers::FormHelper.builder = MyCustomBuilder
# Formtastic::Helpers::FormHelper.builder = Formtastic::FormtasticExtensions


# You can opt-in to Formtastic's use of the HTML5 `required` attribute on `<input>`, `<select>` 
# and `<textarea>` tags by setting this to false (defaults to true).
# Formtastic::FormBuilder.use_required_attribute = false

# You can opt-in to new HTML5 browser validations (for things like email and url inputs) by setting
# this to false. Doing so will add a `novalidate` attribute to the `<form>` tag.
# See http://diveintohtml5.org/forms.html#validation for more info.
# Formtastic::FormBuilder.perform_browser_validations = false


# Date picker override



class DatepickerInput < Formtastic::Inputs::StringInput
  def input_html_options
    super.merge(:class => "#{super[:class]} datepicker")
  end
end

def datepicker_input(method, options = {})
  string_input(method, options.merge(:input_html => {:class => "datepicker"}) )
end

# Time picker override
class TimepickerInput < Formtastic::Inputs::StringInput
  def input_html_options
    super.merge(:class => "#{super[:class]} timepicker")
  end
end

def timepicker_input(method, options = {})
  string_input(method, options.merge(:input_html => {:class => "timepicker"}) )
end



# Datetime picker override
class DatetimepickerInput < Formtastic::Inputs::StringInput
  def input_html_options
    super.merge(:class => "#{super[:class]} datetimepicker")
  end
end

def datetimepicker_input(method, options = {})
  string_input(method, options.merge(:input_html => {:class => "datetimepicker"}) )
end



class WysiwygInput < Formtastic::Inputs::TextInput

  def input_html_options
    wysiwyg_type = input_options.delete(:controls)

    case wysiwyg_type
    when :brief
      super.merge(:class => "#{super[:class]} wysiwyg fluid")
    else
      super.merge(:class => "#{super[:class]} wysiwyg fluid")
    end
  end

  # workaround for CK Editor behaviour
  # does not update text area, so required test fails.
  # error are processed server-side
  def required?
    false
    end  
end


def wysiwyg_input(method, options = {})
  wysiwyg_type = options.delete(:controls)

  case wysiwyg_type
  when :brief
    text_input(method, options.merge(:input_html => {:class => "wysiwyg"}) )
  else
    text_input(method, options.merge(:input_html => {:class => "wysiwyg"}) )
  end
  
end
