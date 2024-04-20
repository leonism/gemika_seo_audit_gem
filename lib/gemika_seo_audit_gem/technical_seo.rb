# lib/seo_audit_gem/technical_seo.rb
module SeoAuditGem
  class TechnicalSEO
    require 'nokogiri'
    require 'open-uri'

    class << self
      # Performs technical SEO checks on a URL
      def check(url)
        html = fetch_html(url)
        { canonical: check_canonical(html), robots: check_robots(html) }
      end

      private

      # Fetches HTML content from a URL
      def fetch_html(url)
        open(url)
      rescue StandardError => e
        puts "Error fetching HTML: #{e.message}"
        nil
      end

      # Check for canonical link presence
      def check_canonical(html)
        doc = Nokogiri::HTML(html)
        canonical_link = doc.xpath("//link[@rel='canonical']").attr('href').to_s
        canonical_link.empty? ? "None" : canonical_link
      end

      # Check for robots meta tag
      def check_robots(html)
        doc = Nokogiri::HTML(html)
        robots_meta = doc.xpath("//meta[@name='robots']").attr('content').to_s
        robots_meta.empty? ? "None" : robots_meta
      end
    end
  end
end
