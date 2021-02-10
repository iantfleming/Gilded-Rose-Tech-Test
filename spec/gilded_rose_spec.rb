# frozen_string_literal: true

require File.join('gilded_rose')

describe GildedRose do
  subject('gilded_rose') { GildedRose.new([Item.new('foo', 12, 20)]) }

  it 'can create an instance of GildedRose' do
    expect(gilded_rose).to be_kind_of(GildedRose)
  end

  describe '#update_quality' do
    it 'responds to the method update_quality' do
      expect(gilded_rose).to respond_to(:update_quality)
    end

    it 'reduces item quality by 1 if the item is not brie or backstage passes' do
      items = [Item.new('foo', 12, 20)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 19
    end

    it 'does not change the name' do
      items = [Item.new('foo', 0, 0)]
      GildedRose.new(items).update_quality
      expect(items[0].name).to eq 'foo'
    end
  end
end
