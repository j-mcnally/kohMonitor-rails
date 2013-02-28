class Authentication < ActiveRecord::Base
  
  attr_accessible :uid, :provider, :token, :token_secret
  belongs_to :user
  
end
