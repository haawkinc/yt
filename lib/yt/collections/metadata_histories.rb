require 'yt/collections/resources'
require 'yt/models/metadata_history'

module Yt
  module Collections
    class MetadataHistories < Resources

      private

      def attributes_for_new_item(data)
        {data: data, asset_id: @parent, auth: @auth}
      end

      def list_params
        asset_id = @parent
        super.tap do |params|
          params[:path] = "/youtube/partner/v1/metadataHistory"
          params[:params] = { 'assetId' => asset_id, 'onBehalfOfContentOwner' => @auth.owner_name }
        end
      end

      def fetch_page(params = {})
        response = list_request(params).run
        {items: [response.body], token: nil}
      end
    end
  end
end
