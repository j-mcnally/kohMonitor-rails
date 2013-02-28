ENV["APP_NAME"]="kohMonitor"
# The name of this business, as displayed to your users throughout the application
ENV["BUSINESS_NAME"]="kohactive"
# the from address used when sending email to customers, and also the email address we send admin emali to (e.g. from the conact form)
ENV["BUSINESS_EMAIL"]="info@kohactive.com"

# used for facebook connect, google analytics, emails and other places where a master domain name is used to represent the business
ENV["BASE_DOMAIN_NAME"]="monitor.kohsrv.net"

# the database namespace used in database.yml, "foobar" will create foobar_development and foobar_test databases for MySQL and MongoDB
ENV["DATABASE_NAMESPACE"]="kohMonitor"
# mysql usernme and password
ENV["MYSQL_USERNAME"]=""
ENV["MYSQL_PASSWORD"]=""
ENV["MYSQL_HOST"]=""
ENV["MYSQL_PORT"]=""

# emails sent in development are intercepted and delivered to the developer, so we dont bombard customers by accident
ENV["DEVELOPER_EMAIL"]=""

# we use AWS as a backend for fog and paperclip
ENV["AWS_ACCESS_KEY_ID"]=""
ENV["AWS_SECRET_ACCESS_KEY"]=""
ENV["S3_NAMESPACE"]=""
ENV["S3_CLOUDFRONT_DOMAIN"]=""

# for onmiauth with facebook and facebook connect/widgets etc
ENV["FACEBOOK_CLIENT_ID"]=""
ENV["FACEBOOK_SECRET"]=""
# for displaying to your customers
ENV["FACEBOOK_FAN_PAGE_NAME"]=" "
ENV["FACEBOOK_FAN_PAGE_ID"]=" "

# for omniauth with twitter
ENV["TWITTER_CONSUMER_KEY"]=""
ENV["TWITTER_CONSUMER_SECRET"]=""
# for displaying to your customers
ENV["TWITTER_SCREEN_NAME"]=""

# Google OAuth
ENV["GOOGLE_APP_ID"]=""
ENV["GOOGLE_APP_SECRET"]=""

# Tumblr OAuth
ENV["TUMBLR_CONSUMER_KEY"]=""
ENV["TUMBLR_SECRET_KEY"]=""

ENV["FOURSQUARE_CONSUMER_KEY"]=""
ENV["FOURSQUARE_CONSUMER_SECRET"]=""

ENV["GITHUB_KEY"]=""
ENV["GITHUB_SECRET"]=""

# urchin code for google analytics
ENV["GOOGLE_ANALYTICS_ACCOUNT_ID"]=""
ENV["GOOGLE_WEBMASTER_TOOLS_META"]=""

# emails generated in development will be delivered through gmail 
ENV["GMAIL_DOMAIN"]=""
ENV["GMAIL_USER_NAME"]=""
ENV["GMAIL_PASSWORD"]=""

# Memcaching
ENV["MEMCACHE_SERVERS"]="localhost:11211"

# Capistrano Deployment setup
ENV["REPOSITORY_URL"]=""
ENV["SSH_USER"]=""
ENV["APP_NAME_SPACE"]=""
ENV["IP_ADDRESS"]=""