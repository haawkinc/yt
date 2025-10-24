require 'yt/models/base'

module Yt
  module Models
    class MetadataHistory < Base
      attr_reader :data
      def initialize(options = {})
        @data = options[:data]
        @asset_id = options[:asset_id]
        @auth = options[:auth]
      end

      def items
        @data['items'] || []
      end

      has_attribute :owner_id do
        @data.dig('origination', 'owner')
      end

      has_attribute :time_provided do
        @data['timeProvided']
      end

      has_attribute :kind do
        @data['kind']
      end

      has_attribute :metadata do
        @data['metadata']
      end
    end
  end
end
