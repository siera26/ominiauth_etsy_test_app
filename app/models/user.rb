class User < ActiveRecord::Base
  attr_accessible :provider, :uid, :email, :first_name, :last_name, :profile, :access_token, :access_secret
  serialize :profile, Hash
  
  def to_s
    "#{first_name} #{last_name}"
  end
  
  def self.create_with_etsy_omniauth(auth)
    user = User.create!({
      provider:       auth["provider"],
      uid:            auth["uid"],
      access_token:   auth['credentials']['token'],
      access_secret:  auth['credentials']['secret'],
      email:          auth["info"]["email"],
      first_name:     auth["info"]["first_name"],
      last_name:      auth["info"]["last_name"],
      profile:        auth["info"]["profile"],
    })
  end

end
