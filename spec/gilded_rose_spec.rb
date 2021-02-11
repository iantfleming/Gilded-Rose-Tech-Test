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

    it 'reduces item quality by 1 if the item is not Aged Brie or Backstage passes' do
      items = [Item.new('foo', 12, 20)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 19
    end

    it 'increases item quality by 1 if item is Aged Brie' do
      items = [Item.new('Aged Brie', 12, 20)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 21
    end

    it 'increases item quality by 1 if item is Backstage passes and sell_in > 10' do
      items = [Item.new('Backstage passes', 12, 20)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 21
    end

    it 'increases item quality by 2 if item is Backstage passes and sell_in between 6 and 10' do
      items = [Item.new('Backstage passes', 9, 20)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 22
    end

    it 'increases item quality by 3 if item is Backstage passes and sell_in <= 5' do
      items = [Item.new('Backstage passes', 5, 20)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 23
    end

    it 'reduces quality to 0 if backstage pass sell_in <= 0' do
      items = [Item.new('Backstage passes', 0, 0)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 0
    end

    it 'increases item quality by 1 if the item is Aged Brie' do
      items = [Item.new('Aged Brie', 12, 20)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 21
    end

    it 'reduces item sell by date by 1 if the item not brie or Backstage passes' do
      items = [Item.new('foo', 12, 20)]
      GildedRose.new(items).update_quality
      expect(items[0].sell_in).to eq 11
    end

    it 'quality will never pass below 0' do
      items = [Item.new('foo', 12, 0)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 0
    end

    it 'the quality of Aged Brie will never exceed 50' do
      items = [Item.new('Aged Brie', 12, 50)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 50
    end

    it 'the quality of Backstage passes will never exceed 50' do
      items = [Item.new('Backstage passes', 12, 50)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 50
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

    it 'Sulfuras does not decrease in quality' do
      items = [Item.new('Sulfuras', 50, 50)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 50
    end

    it 'Sulfuras does not decrease its sell by date' do
      items = [Item.new('Sulfuras', 50, 50)]
      GildedRose.new(items).update_quality
      expect(items[0].sell_in).to eq 50
    end



    it 'does not change the name' do
      items = [Item.new('foo', 0, 0)]
      GildedRose.new(items).update_quality
      expect(items[0].name).to eq 'foo'
    end
  end
end
