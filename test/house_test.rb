require 'minitest/autorun'
require 'minitest/pride'
require './lib/house'

class HouseTest < Minitest::Test

  def test_house_exists
    house = House.new("400000", "123 sugar lane")
    assert_instance_of House, house
  end

  def test_house_has_attributes
    house = House.new("400000", "123 sugar lane")
    assert_equal "400000", house.price
    assert_equal "123 sugar lane", house.address
  end

  def test_house_has_rooms
    house = House.new("400000", "123 sugar lane")
    assert_equal [], house.rooms
  end

  def test_house_can_add_rooms
    house = House.new("400000", "123 sugar lane")
    room_1 = Room.new(:bedroom, 13, 15)
    room_2 = Room.new(:bedroom, 15, 18)
    house.add_room(room_1)
    house.add_room(room_2)
    assert_equal [room_1, room_2], house.rooms
  end

  def test_house_can_show_different_rooms
    house = House.new("400000", "123 sugar lane")
    room_1 = Room.new(:bedroom, 12, 15)
    room_2 = Room.new(:bedroom, 10, 13)
    room_3 = Room.new(:livingroom, 25, 15)
    room_4 = Room.new(:basement, 30, 41)
    house.add_room(room_1)
    house.add_room(room_2)
    house.add_room(room_3)
    house.add_room(room_4)
    assert_equal [room_1, room_2], house.rooms_from_category(:bedroom)
    assert_equal [room_3], house.rooms_from_category(:livingroom)
    assert_equal [room_4], house.rooms_from_category(:basement)
  end

  def test_house_area

    house = House.new("400000", "123 sugar lane")
    room_1 = Room.new(:bedroom, 12, 15)
    room_2 = Room.new(:bedroom, 10, 13)
    room_3 = Room.new(:livingroom, 25, 15)
    room_4 = Room.new(:basement, 30, 41)
    house.add_room(room_1)
    house.add_room(room_2)
    house.add_room(room_3)
    
    assert_equal 1915, house.area
  end

end