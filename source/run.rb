require './robot.rb'
require './parser.rb'

include Parser

command_data = File.read('../commands.txt').split("\n")
robot = Robot.new()

parse_and_run_commands(command_data, robot)