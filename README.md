# Toy Robot Coding Challenge Solution

A Ruby application created to solve the Toy Robot Coding Challenge

## Instructions

To run the Toy Robot Challenge app locally, complete the following steps;

- Step 1: Clone the repo into your local directory by running `git clone https://github.com/PegliOne/toy-robot-challenge.git` in your terminal.
- Step 2: Edit the `commands.txt` file inside the `toy-robot-challenge` directory to include your PLACE, MOVE, LEFT, RIGHT and REPORT commands for the robot. Each command must be on a new line. Commas must be used to separate the x-position, y-position and facing direction supplied to the place command. The commands are not case sensitive.
- Step 3: Move into the app's source directory by entering `cd toy-robot-challenge/source`.
- Step 4: To run the toy robot app enter `ruby run.rb`. The app will automatically exit when all the supplied command have been run.

## Assumptions

- The app assumes the robot's position is an integer value. Floating point values provided using the PLACE command will be rounded down.