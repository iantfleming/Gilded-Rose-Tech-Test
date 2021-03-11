require File.join('gilded_rose')

describe GildedRose do
  describe "#update_quality" do
    it "does not change the name" do
      items = [Item.new("foo", 0, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].name).to eq "foo"
      expect(items[0].sell_in).to eq -1
      expect(items[0].quality).to eq 0
    end
    it "" do
      items = [Item.new("foo", 1, 1)]
      GildedRose.new(items).update_quality()
      expect(items[0].sell_in).to eq 0
      expect(items[0].quality).to eq 0
    end
    it "" do
      items = [Item.new("foo", 2, 2)]
      GildedRose.new(items).update_quality()
      expect(items[0].sell_in).to eq 1
      expect(items[0].quality).to eq 1
    end
    it "name is Sulfuras, Hand of Ragnaros" do
      items = [Item.new("Sulfuras, Hand of Ragnaros", 2, 2)]
      GildedRose.new(items).update_quality()
      expect(items[0].sell_in).to eq 2
      expect(items[0].quality).to eq 2
    end
    it "Aged Brie" do
      items = [Item.new("Aged Brie", 2, 2)]
      GildedRose.new(items).update_quality()
      expect(items[0].sell_in).to eq 1
      expect(items[0].quality).to eq 3
    end
    it "Backstage passes to a TAFKAL80ETC concert" do
      items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 2, 2)]
      GildedRose.new(items).update_quality()
      expect(items[0].sell_in).to eq 1
      expect(items[0].quality).to eq 5
    end
    it "foo" do
      items = [Item.new("foo", -1, 3)]
      GildedRose.new(items).update_quality()
      expect(items[0].sell_in).to eq -2
      expect(items[0].quality).to eq 1
    end
    it "Backstage passes to a TAFKAL80ETC concert" do
      items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 0, 3)]
      GildedRose.new(items).update_quality()
      expect(items[0].sell_in).to eq -1
      expect(items[0].quality).to eq 0
    end
    it "Aged Brie" do
      items = [Item.new("Aged Brie", 0, 3)]
      GildedRose.new(items).update_quality()
      expect(items[0].sell_in).to eq -1
      expect(items[0].quality).to eq 4
    end
    it "Backstage passes to a TAFKAL80ETC concert" do
      items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 3, 49)]
      GildedRose.new(items).update_quality()
      expect(items[0].sell_in).to eq 2
      expect(items[0].quality).to eq 50
    end
    it "Backstage passes to a TAFKAL80ETC concert" do
      items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 13, 49)]
      GildedRose.new(items).update_quality()
      expect(items[0].sell_in).to eq 12
      expect(items[0].quality).to eq 50
    end
    it "Aged Brie" do
      items = [Item.new("Aged Brie", 0, 50)]
      GildedRose.new(items).update_quality()
      expect(items[0].sell_in).to eq -1
      expect(items[0].quality).to eq 50
    end
    it "name is Sulfuras, Hand of Ragnaros" do
      items = [Item.new("Sulfuras, Hand of Ragnaros", -1, 2)]
      GildedRose.new(items).update_quality()
      expect(items[0].sell_in).to eq -1
      expect(items[0].quality).to eq 2
    end
  end
end
