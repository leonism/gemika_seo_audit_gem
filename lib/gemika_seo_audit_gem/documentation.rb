# lib/seo_audit_gem/documentation.rb
module SeoAuditGem
  module Documentation
    HELP_TOPICS = {
      'Keyword Analysis' => 'Help information for Keyword Analysis',
      'Mobile-Friendliness Check' => 'Help information for Mobile-Friendliness Check',
      'Structured Data Validation' => 'Help information for Structured Data Validation',
      # Add more topics as needed...
    }.freeze

    # Provides dynamic help based on method or feature
    def self.help(topic = nil)
      topic ? lookup_help_for(topic) : general_help
    end

    class << self
      private

      # Returns help information for a specific topic
      def lookup_help_for(topic)
        HELP_TOPICS[topic] || "No help available for #{topic}"
      end

      # Returns general help information
      def general_help
        "Available topics: #{HELP_TOPICS.keys.join(', ')}"
      end
    end
  end
end
