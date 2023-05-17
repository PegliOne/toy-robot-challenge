require_relative '../../run.rb'
require_relative '../../config.rb'
require_relative '../../source/robot.rb'
require_relative '../../source/parser.rb'

include Parser

describe '#run_toy_robot_app' do
  context 'invalid board size' do
    before do
      BOARD_SIZE_X = ''
      BOARD_SIZE_Y = 5
    end

    it 'returns the board size error when a board size is invalid' do
      expect(STDOUT).to receive(:puts).with('Error: Board size invalid')
      run_toy_robot_app
    end  
  end

  context 'valid board size' do
    before do
      BOARD_SIZE_X = 5
      BOARD_SIZE_Y = 5
    end

    it 'follows valid commands' do
      INPUT_FILE_NAME = 'test_data/valid_commands.txt'
      expect(STDOUT).to receive(:puts).with('0,3,NORTH')
      run_toy_robot_app
    end  

    it 'follows poorly typed commands' do
      INPUT_FILE_NAME = 'test_data/poorly_typed_valid_commands.txt'
      expect(STDOUT).to receive(:puts).with('0,3,NORTH')
      run_toy_robot_app
    end
  
    it 'ignores command given to an unplaced robot' do
      INPUT_FILE_NAME = 'test_data/unplaced_robot_commands.txt'
      expect(STDOUT).to_not receive(:puts)
      run_toy_robot_app
    end  

    context 'PLACE command would place robot off board' do
      it 'returns an invalid PLACE error and outputs original position' do
        INPUT_FILE_NAME = 'test_data/place_off_board_commands.txt'
        expect(STDOUT).to receive(:puts).with('Error: Invalid PLACE parameters')
        expect(STDOUT).to receive(:puts).with('1,5,NORTH')
        run_toy_robot_app
      end
    end

    context 'MOVE command would move robot off board' do
      it 'ignores the command and outputs original position' do
        INPUT_FILE_NAME = 'test_data/move_off_board_commands.txt'
        expect(STDOUT).to receive(:puts).with('1,5,NORTH')
        run_toy_robot_app
      end 
    end  
  end
end
