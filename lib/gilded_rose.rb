class GildedRose

  QUALITY_UPPER_LIMIT = 50
  QUALITY_LOWER_LIMIT = 0

  def initialize(items)
    @items = items
  end

  def update_regular_items
    @items.each do |item|
      unless item.quality == QUALITY_LOWER_LIMIT
        if item.sell_in > 0
          decrease_sell_in_by_1
          item.quality -= 1
        else
          decrease_sell_in_by_1
          item.quality -= 2
        end
      else
        decrease_sell_in_by_1
      end
    end
  end

  def update_aged_brie()
    @items.each do |item|
      case item.name
      when 'Aged Brie'
        unless item.quality == QUALITY_UPPER_LIMIT
          item.quality += 1
          decrease_sell_in_by_1
        else
          decrease_sell_in_by_1
        end
      end
    end
  end

  def update_sulfuras
    @items.each do |item|
      case item.name
      when 'Sulfuras, Hand of Ragnaros'
        decrease_sell_in_by_1
      end
    end
  end

  def update_backstage_passes()
    @items.each do |item|
      case item.name
      when 'Backstage passes to a TAFKAL80ETC concert'
        if item.sell_in > 10
          item.quality += 1
          decrease_sell_in_by_1
        elsif item.sell_in <= 10 && item.sell_in > 5
          item.quality += 2
          decrease_sell_in_by_1
        elsif item.sell_in <= 5 && item.sell_in > 0
          item.quality += 3
          decrease_sell_in_by_1
        else
          quality_drop_to_0
        end
      end
    end
  end

  private

  def decrease_sell_in_by_1
    @items.each do |item|
      item.sell_in -= 1
    end

    def quality_drop_to_0
      @items.each do |item|
        item.quality -= item.quality
      end
    end
  end




#   def update_quality()
#     @items.each do |item|
#       if item.name != "Aged Brie" and item.name != "Backstage passes to a TAFKAL80ETC concert"
#         if item.quality > 0
#           if item.name != "Sulfuras, Hand of Ragnaros"
#             item.quality = item.quality - 1
#           end
#         end
#       else
#         if item.quality < 50
#           item.quality = item.quality + 1
#           if item.name == "Backstage passes to a TAFKAL80ETC concert"
#             if item.sell_in < 11
#               if item.quality < 50
#                 item.quality = item.quality + 1
#               end
#             end
#             if item.sell_in < 6
#               if item.quality < 50
#                 item.quality = item.quality + 1
#               end
#             end
#           end
#         end
#       end
#       if item.name != "Sulfuras, Hand of Ragnaros"
#         item.sell_in = item.sell_in - 1
#       end
#       if item.sell_in < 0
#         if item.name != "Aged Brie"
#           if item.name != "Backstage passes to a TAFKAL80ETC concert"
#             if item.quality > 0
#               if item.name != "Sulfuras, Hand of Ragnaros"
#                 item.quality = item.quality - 1
#               end
#             end
#           else
#             item.quality = item.quality - item.quality
#           end
#         else
#           if item.quality < 50
#             item.quality = item.quality + 1
#           end
#         end
#       end
#     end
#   end
end

class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end
