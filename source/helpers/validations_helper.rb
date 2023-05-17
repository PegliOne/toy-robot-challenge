require_relative '../../config.rb'

module ValidationsHelper
  def is_board_valid?(x_size, y_size)
    is_board_size_valid?(x_size) && is_board_size_valid?(y_size)
  end

  def is_placed?(x_position, y_position, facing_direction)
    !x_position.nil? && !y_position.nil? && !facing_direction.nil?
  end

  def is_place_data_valid?(x_position, y_position, facing_direction)
    is_x_position_valid?(x_position) && is_y_position_valid?(y_position) && is_direction_valid?(facing_direction)
  end  
  
  def is_x_position_valid?(position)
    position.is_a?(Integer) && position >= 0 && position <= BOARD_SIZE_X ? true : false
  end 
  
  def is_y_position_valid?(position)
    position.is_a?(Integer) && position >= 0 && position <= BOARD_SIZE_Y ? true : false
  end

  private

  def is_board_size_valid?(size)
    size.is_a?(Integer) && size >= 1 ? true : false
  end  

  def is_direction_valid?(direction)
    ['NORTH', 'EAST', 'SOUTH', 'WEST'].include?(direction.upcase) ? true : false
  end
end
