# Quiz-Game
Quiz Game made in x86-64 assembly

Simple quiz game i made in assembly from scratch, it has 3 basic questions.

Only if u fail the first question the game ends, but if u fail the second/third u can try again.


How to compile (on Linux)

    Install NASM sudo apt get install nasm

    Clone and CD to the repo git clone https://github.com/xblyxxxyk/Quiz-Game.git cd Quiz-Game

    Assemble program with NASM nasm -f elf64 -o program.o program.asm

    Link the program ld program.o -o program

    Run the program ./program
