module KohJsonHelper
  
  # Basic JSON Helpers
  # Simple json helpers, including success, error and standard response schema
  # ----------------------------------------------------------------------------------------------------
  
  # a nice standard response schema for json
  def return_json type, hash={}    
    # we require one of these types
    unless [ :success, :error ].include? type
      raise "Invalid json response type: #{type}"
    end
    # To keep the structure consistent, we'll build the json 
    # structure with these default properties.
    default_json = { 
      :status => type, 
      :message => nil,
      :payload => nil,
    }.merge(hash)
    # Return the json hash
    return default_json
  end
  
  # render our standardized json response
  def return_json_response type, hash={}
    render :json => return_json(type, hash)
  end  
  
  # helper for success messages (for actions like delete which dont return models)
  #def json_success message, payload, extra_params={}
  def json_success extra_params={}
    # Standard success json format
    json = {
      success: true,
      message: nil,
      payload: nil,
    }.merge(extra_params)
    # Render the json
    render json: json
    
  end

  # helper for returning failure messages in a common format
  def json_error code, message=nil, metadata={}
    # Standard success json format
    render :json => {
      :error => metadata.merge({
        :message => message || t("api.errors.#{code}"),
        :code => code
      })
    }
  end
  
  
  # JSON Heper for Models
  # ----------------------------------------------------------------------------------------------------
  
  # a standard way to return models. if they have errors then we return the error message
  # this is a DRY approach to creating and updating and then returning JSON responses
  #def json_model model, full=false, extra_params={}
  def json_model model, extra_params={}
    # By default, we use the api_attributes method to return model properties. A custom
    # attributes parameter can be passed also
    method = extra_params[:attributes] || "api_attributes"
    if model.errors.empty?
      render :json => model.send(method).deep_merge(extra_params)
    else 
      json_error :model_error, model.errors.first.join(' ')
    end
  end

  # a standard way to return an array of models
  # arrays of models are passed back in a data object, this is so we can add things we may need in the future such as pagination
  def json_models models, extra_params={}
    # By default, we use the api_attributes method to return model properties. A custom
    # attributes parameter can be passed also
    method = extra_params[:attributes] || "api_attributes"
    render :json => models.collect{|model| model.send(method)} 
  end
  
end


class ActionController::Base
  include Jsonify
end