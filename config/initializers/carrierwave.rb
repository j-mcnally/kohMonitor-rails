CarrierWave.configure do |config|
  
  # Let's check if an AWS Access Key and Secret have been provided, if so
  # then we'll use Amazon to store assets
  if ENV['AWS_ACCESS_KEY_ID'] and ENV['AWS_SECRET_ACCESS_KEY']
    config.fog_credentials = {
      :provider               => 'AWS',       # required
      :aws_access_key_id      => ENV['AWS_ACCESS_KEY_ID'],       # required
      :aws_secret_access_key  => ENV['AWS_SECRET_ACCESS_KEY'],       # required
      :region                 => 'us-east-1'  # optional, defaults to 'us-east-1'
    }
    config.fog_directory  = ENV['S3_NAMESPACE']                     # required
    # If Cloudfront domain is provided, we'll use it as our CDN
    if ENV['S3_CLOUDFRONT_DOMAIN']
      config.fog_host = "//#{ENV['S3_CLOUDFRONT_DOMAIN']}"
    else
      # Otherewise, we'll just use S3
      config.fog_host = "//#{ENV['S3_NAMESPACE']}.s3.amazonaws.com"
    end
    # Optional configurations
    #config.fog_public = false                                   # optional, defaults to true
    #config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}  
  else
    # Otherwise, let's just use local storage
    config.storage = :file
  end  
  
end