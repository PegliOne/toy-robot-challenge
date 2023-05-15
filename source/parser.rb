require './robot.rb'

 module Parser
  def parse_and_run_commands(command_data, robot)
    command_data.each do |command|
      formatted_command = command.upcase.gsub(' ','')
      if formatted_command.match?(/PLACE/)
        parse_and_run_place_command(formatted_command, robot)
      else  
        run_non_place_command(formatted_command, robot)
      end   
    end
  end

  def parse_and_run_place_command(command, robot)
    place_command_data = command.split(',')
    x_position = place_command_data[0].match(/\d+/).to_s.to_i
    y_position = place_command_data[1].match(/\d+/).to_s.to_i
    facing_direction = place_command_data[2].upcase
    robot.place(x_position, y_position, facing_direction)
  end

  def run_non_place_command(command, robot)
    case command
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