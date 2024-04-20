# The CompetitorAnalysis class in your competitor_analysis.rb file
# is designed to fetch SEO metrics from a given URL. The base URL for
# the API calls is https://example.com/api/seo_metrics.

# However, example.com is a placeholder and not a real API service.
# You should replace this with the URL of a real third-party service that provides
# SEO metrics.

# There are several third-party services that provide SEO metrics, such as:

# SEMrush: Offers an API that provides data on website traffic, keyword rankings, backlinks, and much more.
# Ahrefs: Provides an API that offers data on backlinks, keyword rankings, and other SEO metrics.
# Moz: Their API (known as "Mozscape") provides data on website metrics, backlinks, keyword rankings, and more.

# Please note that these services are not free, and you will need to sign up for an API key to use them.
# Once you have an API key, you can replace https://example.com/api/seo_metrics with the actual API URL and
# store the API key in your config.yaml file as I described in the previous responses.



# lib/seo_audit_gem/competitor_analysis.rb
require 'faraday'
require 'json'

module SeoAuditGem
  class CompetitorAnalysis
    BASE_URL = 'https://example.com/api/seo_metrics'.freeze

    class << self
      # Analyzes competitor SEO metrics
      def analyze(competitor_urls)
        competitor_urls.map do |url|
          { url: url, seo_data: fetch_seo_metrics(url) }
        end
      end

      private

      # Fetches SEO metrics from a given URL
      def fetch_seo_metrics(url)
        response_body = fetch_response_body(url)
        JSON.parse(response_body)
      rescue Faraday::Error, JSON::ParserError => e
        handle_error(e)
        nil
      end

      def fetch_response_body(url)
        Faraday.get("#{BASE_URL}?url=#{url}").body
      end

      def handle_error(error)
        puts "Error fetching SEO metrics: #{error.message}"
      end
    end
  end
end
