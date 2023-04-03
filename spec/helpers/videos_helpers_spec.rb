require 'rails_helper'

RSpec.describe VideosHelper, type: :helper do
  describe '#calculate_offset' do
    it 'returns the correct offset value' do
      expect(calculate_offset(1, 5)).to eq(0)
      expect(calculate_offset(2, 5)).to eq(5)
      expect(calculate_offset(3, 5)).to eq(10)
    end
  end

  describe '#fetch_paginated_items' do
    let(:items) { double('items') }

    it 'fetches the correct paginated items' do
      expect(items).to receive(:limit).with(5).and_return(items)
      expect(items).to receive(:offset).with(10).and_return(items)
      fetch_paginated_items(items, 5, 10)
    end
  end

  describe '#calculate_total_pages' do
    let(:items) { double('items', count: 15) }

    it 'returns the correct total pages' do
      expect(calculate_total_pages(10, 5)).to eq(2)
      expect(calculate_total_pages(11, 5)).to eq(3)
      expect(calculate_total_pages(15, 10)).to eq(2)
    end
  end

  describe '#validate_and_set_page_size' do
    it 'returns the correct size' do
      expect(validate_and_set_page_size(0, 5)).to eq(5)
      expect(validate_and_set_page_size(6, 5)).to eq(5)
      expect(validate_and_set_page_size(3, 5)).to eq(3)
    end
  end

  describe '#paginate' do
    let(:items) { double('items') }

    before do
      allow(items).to receive(:count).and_return(30)
      allow(items).to receive(:limit).and_return(items)
      allow(items).to receive(:offset).and_return(items)
    end

    it 'paginates the items correctly' do
      result = paginate(items, page: 2, size: 5, limit: 5)

      expect(result[:items]).to eq(items)
      expect(result[:total_pages]).to eq(6)
      expect(result[:current_page]).to eq(2)
      expect(result[:limit]).to eq(5)
      expect(result[:size]).to eq(5)
    end
  end
end
