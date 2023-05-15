require './validations_helper.rb'

class Robot
  include ValidationsHelper

  def initialize(x_position: nil, y_position: nil, facing_direction: nil)
    place(x_position, y_position, facing_direction)
  end

  def place(x_position, y_position, facing_direction)
    return if place_data_invalid?(x_position, y_position, facing_direction)
    @x_position = x_position
    @y_position = y_position
    @facing_direction = facing_direction
  end

  def move
    return if is_unplaced?(@x_position, @y_position, @facing_direction)
    case @facing_direction
    when 'NORTH'
      do_move(value: @y_position + 1, dimension: 'y')
    when 'EAST'
      do_move(value: @x_position + 1, dimension: 'x') 
    when 'SOUTH'
      do_move(value: @y_position - 1, dimension: 'y')
    when 'WEST'
      do_move(value: @x_position - 1, dimension: 'x')
    end      
  end

  def left
    return if is_unplaced?(@x_position, @y_position, @facing_direction)
    case @facing_direction
    when 'NORTH'
      @facing_direction = 'WEST'
    when 'WEST'
      @facing_direction = 'SOUTH'  
    when 'SOUTH'
      @facing_direction = 'EAST'
    when 'EAST'
      @facing_direction = 'NORTH'
    end      
  end

  def right
    return if is_unplaced?(@x_position, @y_position, @facing_direction)
    case @facing_direction
    when 'NORTH'
      @facing_direction = 'EAST'
    when 'EAST'
      @facing_direction = 'SOUTH'  
    when 'SOUTH'
      @facing_direction = 'WEST'
    when 'WEST'
      @facing_direction = 'NORTH'
    end      
  end
  
  def report
    return if is_unplaced?(@x_position, @y_position, @facing_direction)
    puts "#{@x_position},#{@y_position},#{@facing_direction}"
  end

  private

  def do_move(value:, dimension:)
    return if is_position_invalid?(value, dimension)
    dimension == 'x' ? @x_position = value : @y_position = value
  end
end
