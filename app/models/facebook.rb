	require 'open-uri'
	require 'json'
class Facebook
  def self.profile_for(token)
    url = 'https://graph.facebook.com/me'
    url += '?access_token='+ 'EAACEdEose0cBAJ7wLw413t4ZCzbzYdLsXD0AA3h4uCzXOcqjBLZCqz8ZBETozovTsPZC31RUN3s850H5vMMG4biDalxnwext7hIxwKMhYhN1ZAf8gittk0EvVAZC65kCvLC0P06ZCXthOJB2vATOZBOtT8lbbYoDZCAM11zvp9rxEVXBKCIl2L6LmsCLkYBuyYbgZD'
    url += '&fields=name'
    JSON.parse(open(URI::encode(url)).read)
  end
end
