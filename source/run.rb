require '../config.rb'
require './robot.rb'
require './parser.rb'

include Parser

command_data = File.read(INPUT_FILE_LOCATION).split("\n")
robot = Robot.new()

parse_and_run_commands(command_data, robot)