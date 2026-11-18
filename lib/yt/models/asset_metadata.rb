require 'yt/models/base'

module Yt
  module Models
    # The AssetMetadata object specifies the metadata for an asset.
    # @see https://developers.google.com/youtube/partner/docs/v1/assets#metadataMine
    class AssetMetadata < Base
      def initialize(options = {})
        @data = options[:data]
      end

      # @return [String] A unique value that you, the metadata provider,
      #   use to identify an asset. The value could be a unique ID that
      #   you created for the asset or a standard identifier, such as an
      #   ISRC.
      def custom_id
        @data['customId']
      end

      # @return [String] The asset's title or name.
      def title
        @data['title']
      end

      # @return [String] A description of the asset. The description may be
      #   displayed on YouTube or in CMS.
      def notes
        @data['notes']
      end

      # @return [String] the ID that YouTube assigns and uses to uniquely
      #   identify the asset.
      def description
        @data['description']
      end

      # @return [String] the ISRC of asset
      def isrc
        @data['isrc']
      end

      # @return [String] the UPC of asset
      def upc
        @data['upc']
      end

      # @return [String] the artist of asset
      def artist
        @data['artist']
      end

      # @return [String] the album of asset
      def album
        @data['album']
      end
    end
  end
end
