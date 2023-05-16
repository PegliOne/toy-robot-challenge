require_relative '../../config.rb'

module ValidationsHelper
  def is_placed?(x_position, y_position, facing_direction)
    !x_position.nil? && !y_position.nil? && !facing_direction.nil?
  end

  def is_place_data_valid?(x_position, y_position, facing_direction)
    is_x_position_valid?(x_position) && is_y_position_valid?(y_position) && is_direction_valid?(facing_direction)
  end  
  
  def is_x_position_valid?(position)
    return false unless position.is_a?(Numeric)
    position >= 0 && position <= BOARD_SIZE_X ? true : false
  end 
  
  def is_y_position_valid?(position)
    return false unless position.is_a?(Numeric)
    position >= 0 && position <= BOARD_SIZE_Y ? true : false
  end

  def is_direction_valid?(direction)
    ['NORTH', 'EAST', 'SOUTH', 'WEST'].include?(direction.upcase) ? true : false
  end
end
