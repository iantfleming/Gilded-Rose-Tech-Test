# frozen_string_literal: true

class GildedRose
  def initialize(items)
    @items = items
  end

#   def update_quality
#     @items.each do |item|
#       if (item.name != 'Aged Brie') && (item.name != 'Backstage passes to a TAFKAL80ETC Backstage passes')
#         item.quality = item.quality - 1 if item.quality.positive? && (item.name != 'Sulfuras')
#       elsif item.quality < 50
#         item.quality = item.quality + 1
#         if item.name == 'Backstage passes to a TAFKAL80ETC Backstage passes'
#           item.quality = item.quality + 1 if item.sell_in < (11) && (item.quality < 50)
#           item.quality = item.quality + 1 if item.sell_in < (6) && (item.quality < 50)
#         end
#       end
#       item.sell_in = item.sell_in - 1 if item.name != 'Sulfuras'
#       if item.sell_in.negative?
#         if item.name != 'Aged Brie'
#           if item.name != 'Backstage passes to a TAFKAL80ETC Backstage passes'
#             item.quality = item.quality - 1 if item.quality.positive? && (item.name != 'Sulfuras')
#           else
#             item.quality = item.quality - item.quality
#           end
#         elsif item.quality < 50
#           item.quality = item.quality + 1
#         end
#       end
#     end
#   end
# end

  def update_quality
    @items.each do |item|
      if item.quality < 50 && item.quality.positive?
        if item.name != 'Aged Brie' && item.name != 'Backstage passes'
          subtract_quality_by_1
          subtract_sell_in_by_1
        else
          unless item.name == 'Backstage passes' && item.sell_in < 10
            increase_quality_by_1
          else
            increase_quality_by_2
          end
        end
        # if item.sell_in == 0
        #   subtract_quality_by_2
        # end

      else
        nil
      end
    end
  end

  # def quality_less_than_50
  #   @items.each do |item|
  #     item.quality < 50
  #   end
  # end

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

# g = GildedRose.new([Item.new('Aged Brie', 12, 20)])
#
# i = Item.new('Aged Brie', 12, 20)
#
# p g.update_quality
