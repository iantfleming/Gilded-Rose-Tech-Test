require File.join('gilded_rose')

describe GildedRose do
  subject('gilded_rose') { GildedRose.new([Item.new('foo', 12, 20)]) }


  # describe '#update_quality' do
  #   it 'responds to the method update_quality' do
  #     expect(gilded_rose).to respond_to(:update_quality)
  #   end
  it 'an items quality will decrease by 1' do
    items = [Item.new('foo', 20, 8)]
    GildedRose.new(items).update_regular_items()
    expect(items[0].quality).to eq 7
  end


  it 'once sell by date has passed, quality degrades at double speed' do
    items = [Item.new('foo', -1, 8)]
    GildedRose.new(items).update_regular_items()
    expect(items[0].quality).to eq 6
  end

  it 'the quality of an item is never negative' do
    items = [Item.new('foo', 8, 0)]
    GildedRose.new(items).update_regular_items()
    expect(items[0].quality).to eq 0
  end

  it 'Aged Brie increases in quality the older it gets' do
    items = [Item.new('Aged Brie', 8, 26)]
    GildedRose.new(items).update_aged_brie()
    expect(items[0].quality).to eq 27
  end

  it 'the quality of an item is never greater than 50' do
    items = [Item.new('Aged Brie', 8, 50)]
    GildedRose.new(items).update_aged_brie()
    expect(items[0].quality).to eq 50
  end

  it 'Sulfuras will not decrease in quality' do
    items = [Item.new('Sulfuras, Hand of Ragnaros', 8, 50)]
    GildedRose.new(items).update_quality()
    expect(items[0].quality).to eq 50
  end

  it 'Backstage passes increases quality by 2 when SellIn between 10 and 6' do
    items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 8, 26)]
    GildedRose.new(items).update_quality()
    expect(items[0].quality).to eq 28
  end

  it 'Backstage passes increases quality by 3 when SellIn between 5 and 1' do
    items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 5, 26)]
    GildedRose.new(items).update_quality()
    expect(items[0].quality).to eq 29
  end

  it 'Backstage passes will drop in quality to 0 when SellIn <= 0' do
    items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 0, 26)]
    GildedRose.new(items).update_quality()
    expect(items[0].quality).to eq 0
  end

end
