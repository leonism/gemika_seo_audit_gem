# lib/seo_audit_gem/keyword_analysis.rb
module SeoAuditGem
  class KeywordAnalysis
    require 'nokogiri'
    require 'open-uri'

    # Analyzes the keyword density on a given web page URL
    def self.analyze(url)
      html = open(url)
      doc = Nokogiri::HTML(html)

      text = doc.text.downcase
      word_count = text.scan(/\w+/).size
      keyword_frequencies = text.scan(/\w+/).tally

      # Calculate density and sort keywords by frequency
      keyword_density = keyword_frequencies.transform_values { |v| (v.to_f / word_count) * 100 }
      keyword_density.sort_by { |_k, v| -v }
    end
  end
end
