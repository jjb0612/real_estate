require 'pry'
require './lib/room'

class House

  attr_reader :price,
              :address,
              :rooms

  def initialize(price_arg, address_arg)
    @price   = price_arg
    @address = address_arg
    @rooms   = []
  end

  def add_room(room)
    @rooms << room
  end

  def rooms_from_category(category_arg)
    category_room = @rooms.find_all do |room|
      room.category == category_arg
    end
    category_room
  end

  def area
    total_area = 0
    @rooms.each do |room|
      total_area + room.area
    end
    total_area
  end

end
