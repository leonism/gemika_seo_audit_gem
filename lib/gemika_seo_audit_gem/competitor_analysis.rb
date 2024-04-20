# lib/seo_audit_gem/competitor_analysis.rb
module SeoAuditGem
  class CompetitorAnalysis
    require 'faraday'
    require 'json'

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
        response = Faraday.get("https://example.com/api/seo_metrics?url=#{url}")
        JSON.parse(response.body)
      rescue Faraday::Error => e
        puts "Error fetching SEO metrics: #{e.message}"
        nil
      end
    end
  end
end
