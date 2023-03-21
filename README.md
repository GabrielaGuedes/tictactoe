# TicTacToe

Tic tac toe game done for a selective process of a company. A initial code was provided and then my goal was to improve it and also add more features.

## How to run

With Docker installed on your local machine, build the image:

```bash
$ docker build -t tictactoe .
```

Then, run the image interactively

```bash
$ docker run -it tictactoe
```

## How to test

With Docker installed on your local machine and after building the docker image once, list the containers ids:

```bash
$ docker ps
```

Get the corresponding one and then enter on docker bash:

```bash
$ docker exec -it <id> bash
```

Run rspec:

```bash
$ rspec .
```

## Improvements done

- Refactor, abstracting new classes that didn't exist, like Board, ComputerPlayer, HumanPlayer, Matrix, etc
- Added validation for inputs
- Added specs
- Added linter (Rubocop)
- Added Docker
- Added different modes (HumanVsHuman, ComputerVsComputer, HumanVsComputer)
- Added different difficults (easy, medium, hard)

## About the project structure

This project starts with the `Cli` class, which is responsible for getting the params for the game (mode and difficult) and then starting it. Depending on the params selected, a different game class is started (the options are `HumanVsHuman`, `HumanVsComputer` and `ComputerVsComputer`), which starts different players (it can be a `HumanPlayer`, an `EasyComputerPlayer`, a `MediumComputerPlayer` or a `HardComputerPlayer`) and also a board. All the game classes inherits from the `Game` class and all the players inherits from the `Player` class.

There are also some `utils` classes:

- `InputReceiver`: responsible for receiving user entries and validating it
- `Matrix`: inherits from the ruby's Matrix class, adding more methods to it and chaging other ones that already exist there (like the method `each`)
