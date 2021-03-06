# ToyRobot [![Code Climate](https://codeclimate.com/github/pokonski/robot.png)](https://codeclimate.com/github/pokonski/robot)
Simple robot movement simulation which accepts text commands from files or standard input

## Usage

For a given file with instructions:


```
PLACE 0,0,NORTH
MOVE
REPORT
```

### File input

the console output should be as follows:

```
➜  bin/robot run data/instructions.txt
< PLACE 0,0,NORTH
< MOVE
< REPORT
0,1,NORTH
```

### Standard input:


```
➜  cat data/instructions.txt | bin/robot run
< PLACE 0,0,NORTH
< MOVE
< REPORT
0,1,NORTH
```

## Available commands:


- `PLACE X,Y,DIRECTION`

  place the robot on the board, `X` and `X` should be between 0 and 5. 

  Available directions:
  - `NORTH`
  - `SOUTH`
  - `EAST`
  - `WEST`

- `REPORT`

  prints out the current position and direction of the Robot

- `MOVE`

  moves Robot by one tile in the direction it was looking

- `LEFT`

  rotates Robot counter-clockwise relative to the current direction

- `RIGHT`
  rotates Robot clockwise relative to the current direction

**Note**: Every command will be silently skipped if the Robot is not placed on the board before.
