require_relative 'robot.rb'
require_relative 'helpers/validations_helper.rb'

 module Parser
  include ValidationsHelper

  def parse_and_run_commands(commands, robot)
    return puts "Error: Board dimensions invalid" unless is_board_valid?(BOARD_SIZE_X, BOARD_SIZE_Y)
    commands.split("\n").each do |command|
      formatted_command = command.match(/[a-zA-Z]*/).to_s.upcase
      case formatted_command
      when 'PLACE'
        # Check PLACE params are valid
        place_command_params = command.split(',')
        next puts "Error: Missing position data" unless place_command_params.length >= 3
        next puts 'Error: PLACE positions cannot be non-numeric values' if place_command_params[0,1].any? { |param| !param.match?(/\d+/) }
        next puts 'Error: PLACE positions cannot be decimals' if place_command_params[0,1].any? { |param| param.match?(/\d+\.\d+/) }

        # Parse and run PLACE command
        place_data = parse_place_command(place_command_params)
        robot.place(place_data[:x_position], place_data[:y_position], place_data[:facing_direction])
      when 'MOVE'
        robot.move
      when 'LEFT'
        robot.left
      when 'RIGHT'
        robot.right 
      when 'REPORT'
        robot.report
      else
        puts "Error: Invalid command - #{formatted_command}"    
      end  
    end
  end

  def parse_place_command(params)
    { 
      x_position: params[0].match(/\d+/).to_s.to_i, 
      y_position: params[1].match(/\d+/).to_s.to_i, 
      facing_direction: params[2].strip.upcase
    }
  end
end