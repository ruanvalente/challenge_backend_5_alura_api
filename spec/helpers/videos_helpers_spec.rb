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
      expect(items).to receive(:offset).with(0).and_return(items)
      fetch_paginated_items(items, 5, 0)
    end
  end

  describe '#calculate_total_pages' do
    let(:items) { double('items', count: 15) }

    it 'returns the correct total pages' do
      expect(calculate_total_pages(items)).to eq(15)
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

    it 'returns the correct pagination data' do
      expect(items).to receive(:limit).with(5).and_return(items)
      expect(items).to receive(:offset).with(0).and_return(items)
      expect(items).to receive(:count).and_return(15)
      expect(paginate(items, page: 1, size: 3, limit: 5)).to eq({
                                                                  items: items,
                                                                  total_pages: 15,
                                                                  current_page: 1,
                                                                  limit: 5,
                                                                  size: 3
                                                                })
    end
  end
end
