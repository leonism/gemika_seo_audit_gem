# lib/seo_audit_gem/structured_data.rb
require 'json/ld'

module SeoAuditGem
  class StructuredData
    class << self
      # Validate structured data JSON-LD for a given page
      def validate(json_ld)
        expand_json_ld(json_ld)
      rescue JSON::LD::JsonLdError => e
        handle_error(e)
      end

      private

      # Expands the JSON-LD
      def expand_json_ld(json_ld)
        JSON::LD::API.expand(json_ld)
      end

      # Handles JSON-LD errors
      def handle_error(error)
        { error: error.message }
      end
    end
  end
end
