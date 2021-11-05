# CESP Programming Project TicTacToe

Simple overview of use/purpose.

The Project is a game of TicTacToe which can be played by two players. The game runs on the consol, or morse specific on the Run I/O in RARS.

## Authors

Jannik Rasch

## Demo Video

[![IMAGE ALT TEXT](http://img.youtube.com/vi/-h3eH4ubuno/0.jpg)](http://www.youtube.com/watch?v=-h3eH4ubuno "Video Title")

Replace -h3eH4ubuno in the this .md by your YT video

## Description

An in-depth paragraph about the project and overview of use.

The TicTacToe grid is displayed on the console after every turn. The '-' on the grid marks an emty square. The 'X' and the 'O' mark a square thats occupied by Player X or Player O.

The game follows the regular rules of TicTacToe. That means that the Players place their symbol in a free square on the 3x3 grid. To win the game the Player needs three squares in a row, column or diagonal line. If no Player wins before all nine squares are occupied the game ends with a draw.

The Players select a square by relating to it by its number.
The numbers 1 to 9 are related to the squares counting up from 1 to 9 from the top left square to the bottom right square.
<p align="center">
  <img src="images/grid.png">
</p>

There are a few rules when choosing the square. The selected square can't be occupied by a Player and the entered number has to be in the range of 1 to 9. If one of the rules gets violated the player has to enter a new number in the console.
<p align="center">
  <img src="images/Screenshot_2.png">
</p>
<p align="center">
  <img src="images/Screenshot_6.png">
</p>

The program announces the winner or a draw as soon as Player X or Player O wins or all squares are filled without a winner. The Players are asked to choose whether they want to remach or if they want to exit the game and end the program. Those options are selected by entering a 1 or a 0 in the console. 
<p align="center">
  <img src="images/Screenshot_7.png">
</p>

Entering a 1 restarts the game. That means that the grid gets reset to '-' in all sqaures and the program jumps back to the start of the game. Entering a 0 ends the game and the program. If you want to play another game after this you have to run the program again. The images in paragraph "How to run" show what happens when a 1 or 0 is enterd in the console.
<p align="center">
  <img src="images/Screenshot_5.png">
</p>
<p align="center">
  <img src="images/Screenshot_4.png">
</p>

### How to run

To play the game you have to run the tictactoeV4.asm in RARS. If you run the program Player X starts with choosing a square. The Players choose the square by entering a number between 1 and 9 into the console when they are asked to.

<p align="center">
  <img src="images/Screenshot_1.png">
</p>

## Files
Describe the content of each file of your application: e.g.

src/tictactoeV4.asm

test/unittest_tictactoe_X /..._O / ..._D # 9 unit tests for the three possible outcomes of a game


## Test
Screenshot that shows succedded (unit) tests 
