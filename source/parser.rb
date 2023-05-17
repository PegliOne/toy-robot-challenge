require_relative 'robot.rb'

 module Parser
  def parse_and_run_commands(command_data, robot)
    command_data.each do |command|
      formatted_command = command.match(/[a-zA-z]*/).to_s
      case formatted_command
      when 'PLACE'
        place_data = parse_place_command(command)
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
        puts "Invalid command: #{command}"    
      end  
    end
  end

  def parse_place_command(command)
    place_command_data = command.split(',')
    x_position = place_command_data[0].match(/\d+/).to_s.to_i
    y_position = place_command_data[1].match(/\d+/).to_s.to_i
    facing_direction = place_command_data[2].strip.upcase
    { 
      x_position: x_position, 
      y_position: y_position, 
      facing_direction: facing_direction 
    }
  end
end