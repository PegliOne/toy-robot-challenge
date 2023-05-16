require_relative '../../config.rb'
require_relative '../../source/robot.rb'
require_relative '../../source/parser.rb'

include Parser

describe 'Toy robot app' do
  describe 'valid commands' do
    let(:command_data) { File.read('test_data/valid_commands.txt').split("\n") }
    robot = Robot.new()

    it 'follows the commands' do
      expect(STDOUT).to receive(:puts).with('0,3,NORTH')
      parse_and_run_commands(command_data, robot)
    end  
  end

  describe 'commands do not place robot' do
    let(:command_data) { File.read('test_data/unplaced_robot_commands.txt').split("\n") }
    robot = Robot.new()

    it 'ignores the commands' do
      expect(STDOUT).to_not receive(:puts)
      parse_and_run_commands(command_data, robot)
    end  
  end

  describe 'commands would place robot off board' do
    before do
      BOARD_SIZE_Y = 5
    end  

    describe 'off board place command' do
      let(:command_data) { File.read('test_data/place_off_board_commands.txt').split("\n") }
      robot = Robot.new()

      it 'ignores invalid place command and outputs correct position' do
        expect(STDOUT).to receive(:puts).with('1,5,NORTH')
        parse_and_run_commands(command_data, robot)
      end  
    end

    describe 'off board move commands' do
      let(:command_data) { File.read('test_data/move_off_board_commands.txt').split("\n") }
      robot = Robot.new()

      it 'ignores invalid move command and outputs correct position' do
        expect(STDOUT).to receive(:puts).with('1,5,NORTH')
        parse_and_run_commands(command_data, robot)
      end
    end
  end  
end
