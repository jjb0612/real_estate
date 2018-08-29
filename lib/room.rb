require 'pry'

class Room
  attr_reader :category,
              :length,
              :width,
              :area

  def initialize(category_arg, length_arg, width_arg)
    @category = category_arg
    @length   = length_arg
    @width    = width_arg
    @area     = @length * @width
  end

end
