# this file constantizes, documents and freezes environment veriables which are used by the application
# yes, this file could be dried up, but I think it's useful to see and read the different options
# -----------------------------------------------------------------------------------------------------

# The name of this business, to be used throughout the application
BUSINESS_NAME = ENV['BUSINESS_NAME'].freeze

# used for facebook, google analytics, emails and other places where a master domain name is used to represent the business
BASE_DOMAIN_NAME = ENV['BASE_DOMAIN_NAME'].freeze
ROOT_URL = "http://#{ENV['BASE_DOMAIN_NAME'].freeze}".freeze

# the from address used when sending email to customers, and also the email address used when delivering email to the admin (e.g. from the conact form)
BUSINESS_EMAIL = ENV['BUSINESS_EMAIL'].freeze

# emails sent in development are intercepted and delivered to the developer, so we dont bombard customers by accident
DEVELOPER_EMAIL = ENV['DEVELOPER_EMAIL'].freeze

# urchin code for google analytics
GOOGLE_ANALYTICS_ACCOUNT_ID = ENV['GOOGLE_ANALYTICS_ACCOUNT_ID'].freeze
GOOGLE_WEBMASTER_TOOLS_META = ENV['GOOGLE_WEBMASTER_TOOLS_META'].freeze


# we use AWS as a backend for fog and paperclip
AWS_ACCESS_KEY_ID = ENV['AWS_ACCESS_KEY_ID'].freeze
AWS_SECRET_ACCESS_KEY = ENV['AWS_SECRET_ACCESS_KEY'].freeze
S3_NAMESPACE = ENV['S3_NAMESPACE'].freeze
S3_CLOUDFRONT_DOMAIN = ENV['S3_CLOUDFRONT_DOMAIN'].freeze

FACEBOOK_CLIENT_ID = ENV['FACEBOOK_CLIENT_ID'].freeze
FACEBOOK_SECRET = ENV['FACEBOOK_SECRET'].freeze

TWITTER_CONSUMER_KEY = ENV['TWITTER_CONSUMER_KEY'].freeze
TWITTER_CONSUMER_SECRET = ENV['TWITTER_CONSUMER_SECRET'].freeze

GOOGLE_APP_ID = ENV['GOOGLE_APP_ID'].freeze
GOOGLE_APP_SECRET = ENV['GOOGLE_APP_SECRET'].freeze

TUMBLR_CONSUMER_KEY = ENV['TUMBLR_CONSUMER_KEY'].freeze
TUMBLR_SECRET_KEY = ENV['TUMBLR_SECRET_KEY'].freeze

FOURSQUARE_CONSUMER_KEY = ENV['FOURSQUARE_CONSUMER_KEY'].freeze
FOURSQUARE_CONSUMER_SECRET = ENV['FOURSQUARE_CONSUMER_SECRET'].freeze

GITHUB_KEY = ENV['GITHUB_KEY'].freeze
GITHUB_SECRET = ENV['GITHUB_SECRET'].freeze