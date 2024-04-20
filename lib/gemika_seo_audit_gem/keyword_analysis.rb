# lib/seo_audit_gem/keyword_analysis.rb
require 'nokogiri'
require 'open-uri'

module SeoAuditGem
  class KeywordAnalysis
    class << self
      # Analyzes the keyword density on a given web page URL
      def analyze(url)
        new(url).analyze
      end
    end

    def initialize(url)
      @url = url
    end

    def analyze
      text = fetch_text_from_url
      word_count = count_words(text)
      keyword_frequencies = tally_keywords(text)

      # Calculate density and sort keywords by frequency
      keyword_density = calculate_density(keyword_frequencies, word_count)
      keyword_density.sort_by { |_k, v| -v }
    end

    private

    def fetch_text_from_url
      html = open(@url)
      doc = Nokogiri::HTML(html)
      doc.text.downcase
    rescue StandardError => e
      puts "Error fetching text from URL: #{e.message}"
      ""
    end

    def count_words(text)
      text.scan(/\w+/).size
    end

    def tally_keywords(text)
      text.scan(/\w+/).tally
    end

    def calculate_density(keyword_frequencies, word_count)
      keyword_frequencies.transform_values { |v| (v.to_f / word_count) * 100 }
    end
  end
end
