# lib/seo_audit_gem/structured_data.rb
module SeoAuditGem
  class StructuredData
    require 'json/ld'

    # Validate structured data JSON-LD for a given page
    def self.validate(json_ld)
      JSON::LD::API.expand(json_ld)
    rescue JSON::LD::JsonLdError => e
      { error: e.message }
    end
  end
end
