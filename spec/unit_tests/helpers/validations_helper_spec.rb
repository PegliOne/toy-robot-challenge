require_relative '../../../source/helpers/validations_helper.rb'

describe ValidationsHelper do
  include ValidationsHelper

  describe '#is_board_valid?' do
    it 'returns true if the board sizes are valid' do
      expect(is_board_valid?(1, 1)).to eq(true)
    end

    it 'returns false if a board size is invalid' do
      expect(is_board_valid?(1.5, 1)).to eq(false)
      expect(is_board_valid?('a', 1)).to eq(false)
      expect(is_board_valid?('', 1)).to eq(false)
      expect(is_board_valid?(-1, 1)).to eq(false)
    end  
  end

  describe '#is_placed?' do
    it 'returns true if robot position data is valid' do
      expect(is_placed?(1, 1, 'NORTH')).to eq(true)
    end  

    it 'returns false if a robot position value is missing' do
      expect(is_placed?(1, 1, nil)).to eq(false)
    end  
  end
  
  describe '#is_place_data_valid?' do
    it 'returns true if all the place data is valid' do
      expect(is_place_data_valid?(1, 1, 'NORTH')). to eq(true)
    end
    
    it 'returns false if there is invalid place data' do
      expect(is_place_data_valid?(1, 1, 'str')).to eq(false)
    end  
  end

  describe '#is_x_position_valid?' do
    it 'returns true if the position is valid' do
      BOARD_SIZE_X = 5
      expect(is_x_position_valid?(4)).to eq(true)
    end  

    it 'returns false if the value is not a valid number' do
      BOARD_SIZE_X = 5
      expect(is_x_position_valid?('str')).to eq(false)
      expect(is_x_position_valid?(-1)).to eq(false)
      expect(is_x_position_valid?(11)).to eq(false)
    end 
  end

  describe '#is_y_position_valid?' do
    it 'returns true if the position is valid' do
      BOARD_SIZE_Y = 5
      expect(is_y_position_valid?(4)).to eq(true)
    end  

    it 'returns false if the value is not a valid number' do
      BOARD_SIZE_Y = 5
      expect(is_y_position_valid?('str')).to eq(false)
      expect(is_y_position_valid?(-1)).to eq(false)
      expect(is_y_position_valid?(11)).to eq(false)
    end 
  end

  describe '#is_direction_valid?' do
    it 'returns true if the direction is valid' do
      expect(is_direction_valid?('north')).to eq(true)
    end  

    it 'returns false if the value is not a valid direction' do
      expect(is_direction_valid?('str')).to eq(false)
    end 
  end
end  