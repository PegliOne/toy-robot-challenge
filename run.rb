require_relative 'config.rb'
require_relative 'source/robot.rb'
require_relative 'source/parser.rb'
require_relative 'source/helpers/validations_helper.rb'

include Parser
include ValidationsHelper

def run_toy_robot_app
  return puts "Error: Board size invalid" unless is_board_valid?(BOARD_SIZE_X, BOARD_SIZE_Y)
  commands = File.read(INPUT_FILE_NAME)
  robot = Robot.new
  parse_and_run_commands(commands, robot)
end  

run_toy_robot_app