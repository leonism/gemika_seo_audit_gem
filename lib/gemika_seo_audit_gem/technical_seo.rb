# lib/seo_audit_gem/technical_seo.rb
require 'nokogiri'
require 'open-uri'

module SeoAuditGem
  class TechnicalSEO
    class << self
      # Performs technical SEO checks on a URL
      def check(url)
        html = fetch_html(url)
        return unless html

        { canonical: check_canonical(html), robots: check_robots(html) }
      end

      private

      # Fetches HTML content from a URL
      def fetch_html(url)
        open(url).read
      rescue StandardError => e
        handle_error("Error fetching HTML: #{e.message}")
        nil
      end

      # Check for canonical link presence
      def check_canonical(html)
        extract_meta_tag(html, "//link[@rel='canonical']", 'href')
      end

      # Check for robots meta tag
      def check_robots(html)
        extract_meta_tag(html, "//meta[@name='robots']", 'content')
      end

      # Extracts a meta tag from HTML
      def extract_meta_tag(html, xpath, attribute)
        doc = Nokogiri::HTML(html)
        tag_content = doc.xpath(xpath).attr(attribute).to_s
        tag_content.empty? ? "None" : tag_content
      end

      # Handles errors
      def handle_error(message)
        puts message
      end
    end
  end
end
