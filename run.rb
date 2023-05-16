require_relative 'config.rb'
require_relative 'source/robot.rb'
require_relative 'source/parser.rb'

include Parser

command_data = File.read(INPUT_FILE_NAME).split("\n")
robot = Robot.new()

parse_and_run_commands(command_data, robot)