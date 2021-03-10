

class GildedRose
  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|
      if item.quality < 50 && item.quality.positive?
        if item.name != 'Aged Brie' && item.name != 'Backstage passes'
          subtract_quality_by_1
          subtract_sell_in_by_1
        else
          unless item.name == 'Backstage passes' && item.sell_in < 10 && item.sell_in > 5
            increase_quality_by_1
          else
            increase_quality_by_2
          end
        end
      else
        nil
      end
    end
  end

  private

  def past_sell_by_date?
    @items.each do |item|
      item.sell_in == 0
    end
  end

  def subtract_sell_in_by_1
    @items.each do |item|
      item.sell_in -= 1
    end
  end

  def sell_in_greater_than_10?
    @items.each do |item|
      item.sell_in <= 10
    end
  end

  def subtract_quality_by_1
    @items.each do |item|
      item.quality -= 1
    end
  end

  def subtract_quality_by_2
    @items.each do |item|
      item.quality -= 2
    end
  end

  def increase_quality_by_1
    @items.each do |item|
      item.quality += 1
    end
  end

  def increase_quality_by_2
    @items.each do |item|
      item.quality += 2
    end
  end

  def increase_quality_by_3
    @items.each do |item|
      item.quality += 3
    end
  end
end

class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end
