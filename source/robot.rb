require_relative 'helpers/validations_helper.rb'

class Robot
  include ValidationsHelper
  attr_reader :x_position, :y_position, :facing_direction

  def initialize()
    @x_position = nil
    @y_position = nil
    @facing_direction = nil
  end

  def place(x_position, y_position, facing_direction)
    return unless is_place_data_valid?(x_position, y_position, facing_direction)
    @x_position = x_position
    @y_position = y_position
    @facing_direction = facing_direction
  end

  def move
    return unless is_placed?(@x_position, @y_position, @facing_direction)
    case @facing_direction
    when 'NORTH'
      move_on_y_axis(@y_position + 1)
    when 'EAST'
      move_on_x_axis(@x_position + 1) 
    when 'SOUTH'
      move_on_y_axis(@y_position - 1)
    when 'WEST'
      move_on_x_axis(@x_position - 1)
    end      
  end

  def left
    return unless is_placed?(@x_position, @y_position, @facing_direction)
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
    return unless is_placed?(@x_position, @y_position, @facing_direction)
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
    return unless is_placed?(@x_position, @y_position, @facing_direction)
    puts "#{@x_position},#{@y_position},#{@facing_direction}"
  end

  private

  def move_on_x_axis(value)
    return unless is_x_position_valid?(value)
    @x_position = value
  end

  def move_on_y_axis(value)
    return unless is_y_position_valid?(value)
    @y_position = value
  end
end
