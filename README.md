# Toy Robot Coding Challenge Solution

A Ruby application created to solve the Toy Robot Coding Challenge

## Instructions

To run the Toy Robot Challenge app locally, complete the following steps;

- Step 1: Clone the repo into your local directory by running `git clone https://github.com/PegliOne/toy-robot-challenge.git` in your terminal.
- Step 2: Create and open a new plain text (`.txt`) file or open the existing `test_commands.txt` file in the `toy_robot_challenge` directory
- Step 3: Add the desired PLACE, MOVE, LEFT, RIGHT and REPORT robot commands to the text file. Each command must be on a new line. Commas must be used to separate the x-position, y-position and facing direction supplied to the PLACE command. The commands are not case sensitive.
- Step 4: Open the `config.rb` file (inside the `toy-robot-challenge`). If necessary, change the `INPUT_FILE_LOCATION` to the file path of the plain text file with your commands and change `BOARD_SIZE_X` and `BOARD_SIZE_Y` to desired x and y lengths of the board.
- Step 5: Move into the app's source directory by entering `cd toy-robot-challenge/source`.
- Step 6: To run the toy robot app enter `ruby run.rb`. The app will automatically exit when all the supplied command have been run.

## Assumptions

- The app assumes the robot's position is an integer value. Floating point values provided using the PLACE command will be rounded down.