	require 'open-uri'
	require 'json'
# <script src="facebook.js">
# </script>
class Facebook
  def self.profile_for(token)
    url = 'https://graph.facebook.com/me'
    url += '?access_token='+ token
    url += '&fields=name'
    JSON.parse(open(URI::encode(url)).read)
  end
end
