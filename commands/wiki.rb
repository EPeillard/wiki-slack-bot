require 'mediawiki_api'
require 'logging'
  module Commands
    class Wiki
      @@logger = Logging.logger(STDOUT)
      @@logger.level = :debug
      @@wiki_connection = MediawikiApi::Client.new ENV['API_URL']
      @@logger.debug("I will try to connect to the wiki as #{ENV['USERNAME']}!")
      @@wiki_connection.log_in ENV['USERNAME'], ENV['PASSWORD']
      if @@wiki_connection.logged_in then
        @@logger.debug("Connected successfuly")
      else
        @@logger.debug("Could not connect :(")
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
      def search (client, search)
        @@logger.debug("Searching for #{search}")
        response = @@wiki_connection.action :opensearch, search:search
        @@logger.debug("res is #{response}")
      end
    end
  end
