require_relative '../../source/parser.rb'
require_relative '../../source/robot.rb'

describe Parser do
  include Parser

  describe '#parse_and_run_commands' do
    robot = Robot.new

    context 'place command with missing values' do
      let(:command) { "PLACE 1, NORTH" }

      it 'outputs the missing values error' do
        expect(STDOUT).to receive(:puts).with('Error: Missing parameters for PLACE command')
        parse_and_run_commands(command, robot)
      end  
    end

    context 'place command with decimal value' do
      let(:command) { "PLACE 1.5, 1, NORTH" }

      it 'outputs the decimal positions error' do
        expect(STDOUT).to receive(:puts).with('Error: PLACE positions cannot be decimals')
        parse_and_run_commands(command, robot)
      end  
    end

    context 'invalid command' do
      let(:command) { "PUT 1, 1, NORTH" }

      it 'outputs the invalid command error' do
        expect(STDOUT).to receive(:puts).with('Error: Invalid command - PUT')
        parse_and_run_commands(command, robot)
      end  
    end
  end  

  describe '#parse_place_command' do
    let(:expected) {{
      x_position: 1,
      y_position: 1,
      facing_direction: 'NORTH'
    }}

    it 'parses a place command' do
      expect(parse_place_command(['PLACE 1', '1', 'NORTH'])).to eq(expected)
    end

    it 'parses a poorly typed place command' do
      expect(parse_place_command(['place 1a', 'a1', 'north'])).to eq(expected)
    end

    it 'sets position to nil if non-numerics are provided' do
      expect(parse_place_command(['PLACE aa', '1', 'NORTH'])[:x_position]).to eq(nil)
    end  
  end
end  