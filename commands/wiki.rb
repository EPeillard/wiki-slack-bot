require 'mediawiki_api'
  module Commands
    class Wiki
      @@wiki_connection = MediawikiApi::Client.new ENV['API_URL']
      client.message channel: data['channel'], text: "I will try to connect to the wiki !"
      wiki_connection.log_in ENV['USERNAME'], ENV['PASSWORD']
      if wiki_connection.logged_in then
          client.message channel: data['channel'], text: "Connected successfuly"
      else
          client.message channel: data['channel'], text: "Could not connect :("
      end
=begin
      wiki_connection = MediawikiApi::Client.new "https://wiki.inria.fr/hybrid/api.php"
      wiki_connection.log_in "username", "password"
      match(/^!wiki search (?<terms>\w*)\s(?<contentwiki>.*)$/) do |client, data, match |
        response = wiki_connection.query titles: match[:terms]
        pageid = response.data["pageid"]
        client.say(channel: data.channel, text: "Your wiki is created http://MediaWiki-URL?curid=#{pageid}")
      end
=end
    end
  end
