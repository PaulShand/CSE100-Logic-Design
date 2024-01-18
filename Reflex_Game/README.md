# Project Description

## State Machine-Based Game on FPGA Board

### Overview
This project focuses on developing a game on an FPGA board, controlled using a button. The game combines the concept of a state machine with hardware components to create an interactive and challenging experience.

### Game Mechanics
- **Random Number Generation**: Utilizes a Linear Feedback Shift Register (LFSR) to generate a random number displayed on the board.
- **Count-Up Timer**: A separate number counts up every 0.25 seconds, visible on the display.
- **Objective**: Players aim to press the button when the count-up number matches the randomly generated number. The matching window is deliberately narrow, adding to the game's challenge.

### Implementation
- **State Machine**: Central to the game's logic, managing the various states and transitions based on player input and timing.
- **Hardware Utilization**: Integrates a hex7seg display developed in a previous lab for visual output.
- **Synchronization and Timing**: The game elements are carefully synchronized, with precise timing managed through the state machine and counter mechanics.

This project showcases the practical application of state machines in game development on hardware platforms, combining user interaction, random number generation, and real-time counting.
