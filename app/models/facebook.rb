require 'open-uri'
require 'json'

class Facebook
  def self.profile_for(token)
  	puts "*** Fb-token; #{token} ***"
    url = 'https://graph.facebook.com/me'
    url += '?access_token='+ token
    url += '&fields=name'
    JSON.parse(open(URI::encode(url)).read)
  end
end
