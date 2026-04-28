require 'yt/collections/base'
require 'yt/models/bulk_report'

module Yt
  module Collections
    # @private
    class BulkReports < Base

    private

      def list_params
        super.tap do |params|
          params[:host] = 'youtubereporting.googleapis.com'
          params[:path] = "/v1/jobs/#{@parent.id}/reports"
          params[:params] = reports_params
        end
      end

      def reports_params
        apply_where_params! on_behalf_of_content_owner: @auth.owner_name
      end

      def items_key
        'reports'
      end
    end
  end
end
