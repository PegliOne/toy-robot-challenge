require_relative '../../source/robot.rb'

describe Robot do
  describe '#initialize' do
    it 'creates an unplaced robot' do
      robot = Robot.new()
      expect(robot.x_position).to eq(nil)
      expect(robot.y_position).to eq(nil)
      expect(robot.facing_direction).to eq(nil)
    end
  end

  context 'robot has been created' do
    robot = Robot.new()

    describe '#place' do
      it 'places the robot in the correct position' do
        robot.place(1, 1, 'NORTH')
        expect(robot.x_position).to eq(1)
        expect(robot.y_position).to eq(1)
        expect(robot.facing_direction).to eq('NORTH')
      end
    end

    describe '#move' do
      it 'moves the robot north' do
        robot.place(1, 1, 'NORTH')
        robot.move
        expect(robot.x_position).to eq(1)
        expect(robot.y_position).to eq(2)
      end

      it 'moves the robot east' do
        robot.place(1, 1, 'EAST')
        robot.move
        expect(robot.x_position).to eq(2)
        expect(robot.y_position).to eq(1)
      end

      it 'moves the robot south' do
        robot.place(1, 1, 'SOUTH')
        robot.move
        expect(robot.x_position).to eq(1)
        expect(robot.y_position).to eq(0)
      end

      it 'moves the robot west' do
        robot.place(1, 1, 'WEST')
        robot.move
        expect(robot.x_position).to eq(0)
        expect(robot.y_position).to eq(1)
      end
    end

    describe '#left' do
      it 'turns the robot from north to west' do
        robot.place(1, 1, 'NORTH')
        robot.left
        expect(robot.facing_direction).to eq('WEST')
      end

      it 'turns the robot from west to south' do
        robot.place(1, 1, 'WEST')
        robot.left
        expect(robot.facing_direction).to eq('SOUTH')
      end

      it 'turns the robot from south to east' do
        robot.place(1, 1, 'SOUTH')
        robot.left
        expect(robot.facing_direction).to eq('EAST')
      end

      it 'turns the robot from east to north' do
        robot.place(1, 1, 'EAST')
        robot.left
        expect(robot.facing_direction).to eq('NORTH')
      end
    end

    describe '#right' do
      it 'turns the robot from north to east' do
        robot.place(1, 1, 'NORTH')
        robot.right
        expect(robot.facing_direction).to eq('EAST')
      end

      it 'turns the robot from east to south' do
        robot.place(1, 1, 'EAST')
        robot.right
        expect(robot.facing_direction).to eq('SOUTH')
      end

      it 'turns the robot from south to west' do
        robot.place(1, 1, 'SOUTH')
        robot.right
        expect(robot.facing_direction).to eq('WEST')
      end

      it 'turns the robot from west to north' do
        robot.place(1, 1, 'WEST')
        robot.right
        expect(robot.facing_direction).to eq('NORTH')
      end
    end

    describe '#report' do
      it 'reports the robot position' do
        robot.place(1, 1, 'NORTH')
        expect(STDOUT).to receive(:puts).with('1,1,NORTH')
        robot.report
      end
    end
  end    
end  