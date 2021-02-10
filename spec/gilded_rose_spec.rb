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

    it 'reduces item sell by date by 1 if the item is not brie or backstage passes' do
      items = [Item.new('foo', 12, 20)]
      GildedRose.new(items).update_quality
      expect(items[0].sell_in).to eq 11
    end

    it 'quality will never pass below 0' do
      items = [Item.new('foo', 12, 0)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 0
    end

    it 'reduces the quality by 1 for multiple items' do
      items = [Item.new('foo', 12, 20)]
      items << Item.new('ham', 15, 25)
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 19
      expect(items[1].quality).to eq 24
    end

    it 'reduces the sell by date by 1 for multiple items' do
      items = [Item.new('foo', 12, 20)]
      items << Item.new('ham', 15, 25)
      GildedRose.new(items).update_quality
      expect(items[0].sell_in).to eq 11
      expect(items[1].sell_in).to eq 14
    end

    it 'reduces quality twice as fast when the sell by date has passed' do
      items = [Item.new('foo', -1, 20)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 18
    end

    it 'does not change the name' do
      items = [Item.new('foo', 0, 0)]
      GildedRose.new(items).update_quality
      expect(items[0].name).to eq 'foo'
    end
  end
end
