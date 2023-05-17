require_relative 'robot.rb'
require_relative 'helpers/validations_helper.rb'

 module Parser
  def parse_and_run_commands(commands, robot)
    commands.split("\n").each do |command|
      formatted_command = command.match(/[a-zA-Z]*/).to_s.upcase
      case formatted_command
      when 'PLACE'
        # Check PLACE params are valid
        place_command_params = command.split(',')
        next puts "Error: Missing parameters for PLACE command" unless place_command_params.length >= 3

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