# ToyRobot

Simple robot movement simulation which accepts text commands from files or standard input

## Usage

For a given file with instructions:


```
PLACE 0,0,NORTH
MOVE
REPORT
```

the console output should be as follows:

```
➜  bin/robot run data/instructions.txt
< PLACE 0,0,NORTH
< MOVE
< REPORT
0,1,NORTH
```
