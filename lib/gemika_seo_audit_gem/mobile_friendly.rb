# lib/seo_audit_gem/mobile_friendly.rb
require 'faraday'
require 'json'
require 'yaml'

module SeoAuditGem
  class MobileFriendly
    BASE_URL = 'https://www.googleapis.com/pagespeedonline/v5/runPagespeed'.freeze

    class << self
      # Checks if a URL is mobile-friendly
      def check(url)
        api_key = load_api_key
        response = fetch_response(url, api_key)
        parse_response(response)
      end

      private

      # Fetches the API response
      def fetch_response(url, api_key)
        Faraday.get(BASE_URL, { url: url }, headers(api_key))
      rescue Faraday::Error => e
        handle_error("Error fetching response: #{e.message}")
        nil
      end

      # Parses the API response
      def parse_response(response)
        JSON.parse(response.body)
      rescue JSON::ParserError => e
        handle_error("Error parsing response: #{e.message}")
        nil
      end

      # Returns the headers for the API request
      def headers(api_key)
        {
          'Content-Type' => 'application/json',
          'X-Referer' => 'https://developers.google.com',
          'Authorization' => "Bearer #{api_key}"
        }
      end

      # Handles errors
      def handle_error(message)
        puts message
      end

      def load_api_key
        config = YAML.load_file(File.join(__dir__, '..', '..', '..', 'config.yaml'))
        config['mobile_friendly_api_key']
      end
    end
  end
end
