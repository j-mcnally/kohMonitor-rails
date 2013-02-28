# kohdr

kohdr is base for rapidly building web applications in rails. Essentially it is
a boilerplate with Rails 3.2.3, gems, devise, etc. The following is included by 
default:

1. Rails 3.2.3
2. Devise with omni-auth
3. Devise views including social registration
4. User and Authentication models
5. RVMRC file


## Getting Started

Getting started is quick and easy. You should be up and running within a few minutes. 

### Step 1. Clone the repo

This should be pretty self evident.

### Step 2. Setup your rvmrc.

The rvmrc file sets up your environment variables, including app name, email, API credentials, AWS, etc. It's pretty simple to set up.

1. Create a new file called .rvmrc
2. Copy the rvmrc.txt content into the .rvmrc file
3. Fill in the details
4. Save your changes.
5. In terminal, cd out of the directory and back in to apply those changes.

### Step 3. Setup your databases

1. Create your database: `rake db:create`
2. Run the migrations: `rake db:migrate`


### Step 4. Start building

Profit. Once you've set up your rvmrc and database you should be ready to go. Start your rails server and navigation to localhost:3000/users/sign_up to create an account.


## OAuth

Omniauth comes baked in with a bunch of providers. Feel free to add your own. 

1. Facebook
2. Twitter
3. Google
4. Tumblr
5. Foursquare
6. Github

These are not all required. To turn one on, all you need to do is add the API credentials to the .rvmrc file. The app will handle devise configuration and setup.


## Front-end

The app has a few front-end tools by default. You can easily manage these from the gemfile. They include:

1. jQuery
2. Sass
3. Haml
4. [Bootstrap-sass](https://github.com/thomas-mcdonald/bootstrap-sass)

You can easily add your favorite front-end gems and customize as much as you'd like.


## Development Mode

I've included a few of my favorite development gems. They include:

1. [Capistrano](https://github.com/capistrano/capistrano) (for deployments)
2. [thin](https://github.com/macournoyer/thin/) (ruby web server)
3. [Bullet](https://github.com/flyerhzm/bullet) (N+1 queries and eager loading)


## File, Uploads and Assets

There are quite a few gems installed to work with file uploads, assets and AWS.

1. RMajick
2. [Fog](https://github.com/fog/fog) (ruby cloud services library)
3. [Carrierwave](https://github.com/jnicklas/carrierwave) (file uploads)
4. [plupload-rails](https://github.com/sutherland/plupload-rails) (Plupload and rails 3.1 asset pipeline)
5. [asset_sync](https://github.com/rumblelabs/asset_sync) (Sync assets between Rails asset pipeline and S3)
6. [Dalli](https://github.com/mperham/dalli) (Memcached client for Ruby)
7. [rack-cache](https://github.com/rtomayko/rack-cache) (HTTP caching for ruby)


## Additional Gems

There are a few additional gems I added that are really useful.

1. [fb_graph](https://github.com/nov/fb_graph) (Facebook Graph API wrapper)
2. [json_output_helper](https://github.com/craigulliott/json_output_helper) (Normalize JSON output)
3. [dynamic_models](https://github.com/craigulliott/dynamic_models) (Build models dynamically)
4. [Faraday](https://github.com/technoweenie/faraday) (HTTP client library)
5. [Kaminari](https://github.com/amatsuda/kaminari) (Pagination)
6. [geocoder](https://github.com/alexreisner/geocoder) (Ruby geocoding solution)


## License

[MIT License](http://www.opensource.org/licenses/MIT). Copyright 2012 [kohactive](http://www.kohactive.com)