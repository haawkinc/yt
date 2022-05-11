require 'spec_helper'
require 'yt/models/metadata_history'

describe Yt::Models::MetadataHistory do
  let(:params) { { assetId: 'A123456789012345', onBehalfOfContentOwner: 'L3rdz6zNy123wJMc2u6-lg' } }
  let(:auth) { double('auth', owner_name: 'L3rdz6zNy123wJMc2u6-lg') }
  let(:data) do
    {
      'items' => [
        {
          'kind' => 'youtubePartner#metadataHistory',
          'metadata' => {
            'customId' => 'IDENTIFYY_U3284_T622067',
            'title' => 'غير شبلك ياصدر',
            'genre' => ['other'],
            'isrc' => 'QZ6ZQ2077693',
            'artist' => ['ازهر الناطق'],
            'label' => 'ازهر الناطق'
          },
          'origination' => {
            'source' => 'content_id_api',
            'owner' => 'L3rdz6zNy123wJMc2u6-lg'
          },
          'timeProvided' => '2021-02-11T20:45:50.000Z'
        }
      ]
    }
  end

  subject(:metadata_history) { described_class.new(data: data, params: params, auth: auth) }

  describe '#items' do
    it 'returns the array of metadata history items' do
      expect(metadata_history.data['items'].map do |item_data| described_class.new(data: item_data, auth: auth)
      end.size).to eq 1
      expect(subject.items.first['kind']).to eq 'youtubePartner#metadataHistory'
    end

    it 'returns correct owner_id, time_provided, kind, and metadata' do
      items = metadata_history.data['items'].map { |item_data| described_class.new(data: item_data, auth: auth) }
      item = items.first
      expect(item.owner_id).to eq 'L3rdz6zNy123wJMc2u6-lg'
      expect(item.time_provided).to eq '2021-02-11T20:45:50.000Z'
      expect(item.kind).to eq 'youtubePartner#metadataHistory'
      expect(item.metadata['title']).to eq 'غير شبلك ياصدر'
    end
  end
end
