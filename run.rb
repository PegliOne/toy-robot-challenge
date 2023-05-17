require_relative 'config.rb'
require_relative 'source/robot.rb'
require_relative 'source/parser.rb'

include Parser

commands = File.read(INPUT_FILE_NAME)
robot = Robot.new

parse_and_run_commands(commands, robot)