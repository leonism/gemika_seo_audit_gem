# lib/seo_audit_gem/reporting.rb
require 'json'

module SeoAuditGem
  class Reporting
    class << self
      # Generates a customizable SEO audit report
      def generate_report(data, format: :json)
        case format
        when :json
          generate_json_report(data)
        when :html
          generate_html_report(data)
        else
          handle_unsupported_format
        end
      end

      private

      # Generates a JSON report
      def generate_json_report(data)
        JSON.pretty_generate(data)
      rescue JSON::GeneratorError => e
        handle_error("Error generating JSON report: #{e.message}")
        nil
      end

      # Generates an HTML report
      def generate_html_report(data)
        "<!DOCTYPE html>
        <html>
        <head>
          <title>SEO Audit Report</title>
          <style>
            body {
              font-family: Arial, sans-serif;
              margin: 0;
              padding: 0;
              background-color: #f0f0f0;
            }
            .container {
              width: 80%;
              margin: 0 auto;
              padding: 20px;
              background-color: #fff;
              border-radius: 5px;
              box-shadow: 0px 0px 10px 0px rgba(0,0,0,0.1);
            }
            h1 {
              color: #333;
              text-align: center;
            }
            p {
              color: #666;
              line-height: 1.6;
            }
            strong {
              color: #333;
            }
          </style>
        </head>
        <body>
          <div class='container'>
            <h1>SEO Audit Report</h1>" +
            data.map { |key, value| "<p><strong>#{key}:</strong> #{value}</p>" }.join +
          "</div>
        </body>
        </html>"
      rescue StandardError => e
        handle_error("Error generating HTML report: #{e.message}")
        nil
      end

      # Handles unsupported formats
      def handle_unsupported_format
        "Unsupported format"
      end

      # Handles errors
      def handle_error(message)
        puts message
      end
    end
  end
end
