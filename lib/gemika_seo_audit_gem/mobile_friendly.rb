# lib/seo_audit_gem/mobile_friendly.rb
require 'faraday'
require 'json'

module SeoAuditGem
  class MobileFriendly
    API_URL = 'https://searchconsole.googleapis.com/v1/urlTestingTools/mobileFriendlyTest:run'

    class << self
      # Entry point for mobile-friendly check
      def check(url, api_key)
        response = make_request(url, api_key)
        parse_response(response)
      end

      private

      # Makes a POST request to the Google Mobile-Friendly Test API
      def make_request(url, api_key)
        Faraday.post(API_URL, {url: url}.to_json, headers(api_key))
      rescue Faraday::Error => e
        puts "Error making request: #{e.message}"
        nil
      end

      # Parses the API response
      def parse_response(response)
        JSON.parse(response.body)
      rescue JSON::ParserError => e
        puts "Error parsing response: #{e.message}"
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
    end
  end
end