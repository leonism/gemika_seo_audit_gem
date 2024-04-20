# Require the necessary files in alphabetical order
require_relative 'gemika_seo_audit_gem/backlink_analysis'
require_relative 'gemika_seo_audit_gem/competitor_analysis'
require_relative 'gemika_seo_audit_gem/content_quality'
require_relative 'gemika_seo_audit_gem/continuous_monitoring'
require_relative 'gemika_seo_audit_gem/documentation'
require_relative 'gemika_seo_audit_gem/integration'
require_relative 'gemika_seo_audit_gem/keyword_analysis'
require_relative 'gemika_seo_audit_gem/mobile_friendly_check'
require_relative 'gemika_seo_audit_gem/performance_optimization'
require_relative 'gemika_seo_audit_gem/reporting'
require_relative 'gemika_seo_audit_gem/structured_data_validation'
require_relative 'gemika_seo_audit_gem/technical_seo'

module GemikaSeoAuditGem
  class << self
    # Entry point for SEO audit
    def perform_audit(url)
      {
        keyword_analysis: perform_keyword_analysis(url),
        mobile_friendly_check: perform_mobile_friendly_check(url),
        structured_data_validation: perform_structured_data_validation(url)
        # Add other module methods as needed
      }
    end

    private

    # Performs keyword analysis on the given URL
    def perform_keyword_analysis(url)
      KeywordAnalysis.analyze(url)
    rescue StandardError => e
      handle_error('KeywordAnalysis', e)
    end

    # Checks if the given URL is mobile-friendly
    def perform_mobile_friendly_check(url)
      MobileFriendlyCheck.check(url)
    rescue StandardError => e
      handle_error('MobileFriendlyCheck', e)
    end

    # Validates the structured data of the given URL
    def perform_structured_data_validation(url)
      StructuredDataValidation.validate(url)
    rescue StandardError => e
      handle_error('StructuredDataValidation', e)
    end

    # Handles errors that occur during SEO audits
    def handle_error(audit_type, error)
      puts "Error during #{audit_type}: #{error.message}"
      nil
    end
  end
end


# git remote add origin https://github.com/leonism/gemika_seo_audit_gem.git
# git branch -M main
# git push -u origin main
# lib/gemika_seo_audit_gem.rb
