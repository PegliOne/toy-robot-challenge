# Toy Robot Coding Challenge Solution

A Ruby application created to solve the Toy Robot Coding Challenge

## Technical Requirements

- Ruby 3.0.0
- Rspec gem (for testing)

## Instructions

To run the Toy Robot Challenge app locally, complete the following steps;

- Step 1: Clone the repo into your local directory by running `git clone https://github.com/PegliOne/toy-robot-challenge.git` in your terminal.
- Step 2: Create a new plain text (`.txt`) file in the `toy-robot-challenge` directory or open the existing `example_commands.txt` file.
- Step 3: Add the desired PLACE, MOVE, LEFT, RIGHT and REPORT robot commands to the text file. Each command must be on a new line. Commas must be used to separate the x-position, y-position and facing direction supplied to the PLACE command. The commands are not case sensitive.
- Step 4: Open the `config.rb` file (inside the `toy-robot-challenge`). If necessary, change the `INPUT_FILE_NAME` to the name of the plain text file with your commands and change `BOARD_SIZE_X` and `BOARD_SIZE_Y` to desired x and y lengths of the board.
- Step 5: To run the toy robot app enter `ruby run.rb` in the terminal. The app will automatically exit when all the supplied command have been run.

## Testing

To test the app, complete the following steps;

- Step 1: Install the rspec gem by running `gem install rspec` inside the `toy-robot-challenge` directory
- Step 2: Enter `rspec spec` in the terminal to run all the unit and integration tests or specify a specific spec folder or file to run (e.g. `rspec spec/unit_tests/robot_spec.rb`)
