# lib/seo_audit_gem/reporting.rb
module SeoAuditGem
  class Reporting
    require 'json'

    class << self
      # Generates a customizable SEO audit report
      def generate_report(data, format: :json)
        case format
        when :json
          JSON.pretty_generate(data)
        when :html
          generate_html_report(data)
        else
          "Unsupported format"
        end
      end

      private

      # Generates an HTML report
      def generate_html_report(data)
        "<html><head><title>SEO Audit Report</title></head><body>" +
        "<h1>SEO Audit Report</h1>" +
        data.map { |key, value| "<p><strong>#{key}:</strong> #{value}</p>" }.join +
        "</body></html>"
      end
    end
  end
end
