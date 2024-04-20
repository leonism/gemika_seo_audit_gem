# lib/seo_audit_gem/backlink_analysis.rb
require 'faraday'
require 'json'
require 'yaml'

module SeoAuditGem
  class BacklinkAnalysis
    BASE_URL = 'https://api.backlinktool.org'.freeze

    class << self
      # Analyzes backlinks using an external API
      def analyze(url)
        new(url).analyze
      end
    end

    def initialize(url)
      @url = url
      @api_key = load_api_key
    end

    def analyze
      JSON.parse(response_body)
    rescue Faraday::Error => e
      handle_error(e)
    end

    private

    def load_api_key
      config = YAML.load_file(File.join(__dir__, '..', '..', '..', 'config.yaml'))
      config['api_key']
    end
  end
end
