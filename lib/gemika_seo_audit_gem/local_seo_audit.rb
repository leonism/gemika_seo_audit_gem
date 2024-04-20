# lib/gemika_seo_audit_gem/local_seo_audit.rb
require 'faraday'
require 'nokogiri'

# The GemikaSeoAuditGem module provides functionality for performing local SEO audits.
module GemikaSeoAuditGem
  class LocalSeoAudit
    # Initializes a new instance with the provided URL.
    def initialize(url)
      @url = url
    end

    # Performs the local SEO audit.
    def check
      {
        name: extract_name,
        address: extract_address,
        phone: extract_phone
      }
    rescue StandardError => e
      handle_error(e)
    end

    # Class method to initiate and perform the audit.
    def self.check(url)
      new(url).check
    end

    private

    # Fetches and caches the HTML content from the URL.
    def html
      @html ||= Faraday.get(@url).body
    end

    # Parses and caches the HTML document.
    def doc
      @doc ||= Nokogiri::HTML(html)
    end

    # Extracts the business name from the HTML.
    def extract_name
      doc.css('.local-name').text.strip
    end

    # Extracts the business address from the HTML.
    def extract_address
      doc.css('.local-address').text.strip
    end

    # Extracts the business phone number from the HTML.
    def extract_phone
      doc.css('.local-phone').text.strip
    end

    # Logs and handles errors during the audit.
    def handle_error(error)
      puts "Error during Local SEO Audit: #{error.message}"
      nil
    end
  end
end
