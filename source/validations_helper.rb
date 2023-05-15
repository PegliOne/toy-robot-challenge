module ValidationsHelper
  X_BOARD_SIZE = 5
  Y_BOARD_SIZE = 5

  def is_unplaced?(x_position, y_position, facing_direction)
    x_position.nil? || y_position.nil? || facing_direction.nil?
  end

  def place_data_invalid?(x_position, y_position, facing_direction)
    is_position_invalid?(x_position, 'x') || is_position_invalid?(y_position, 'y') || is_direction_invalid?(facing_direction)
  end  
  
  def is_position_invalid?(position, dimension)
    return true unless position.is_a? Numeric
    max_value = dimension == 'x' ? X_BOARD_SIZE : Y_BOARD_SIZE
    position >= 0 && position <= max_value ? false : true
  end  

  def is_direction_invalid?(direction)
    ['NORTH', 'EAST', 'SOUTH', 'WEST'].include?(direction.upcase) ? false : true
  end
end
