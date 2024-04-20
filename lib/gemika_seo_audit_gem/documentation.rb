# lib/seo_audit_gem/documentation.rb
module SeoAuditGem
  module Documentation
    # Provides dynamic help based on method or feature
    def self.help(topic = nil)
      if topic
        lookup_help_for(topic)
      else
        general_help
      end
    end

    class << self
      private

      # Returns help information for a specific topic
      def lookup_help_for(topic)
        # Example: Fetch help information from a local file or documentation source
        "Help information for #{topic}"
      end

      # Returns general help information
      def general_help
        "Available topics: Keyword Analysis, Mobile-Friendliness Check, Structured Data Validation, and more..."
      end
    end
  end
end
