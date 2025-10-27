# BANDIT

A simple client for the game [Over The Wire - Bandit][OTW-bandit].

This project was created to help players "skip" some steps that may occur throughout their spaced playthrough due to the limited time available to focus on them.

It can help you with things like:

- Connecting to each level more easily
- Obtaining a password you've already acquired, but it's changed due to the passage of time, forcing you to go through the levels again
- Organized archiving of the resolution of each step

**WARNING:** If you're a complete beginner in any Linux/Bash/Networking topic,
It is strongly recommended that you complete the first few levels using your terminal alone, without using this client, as it's intended to skip the "bureaucracy" mentioned above.
This "bureaucracy" is part of the topics covered at the beginning of the game. If you're not familiar with these steps, it's recommended that you do them manually until you've mastered them.

## Bandit's Preamble

The Bandit wargame is aimed at absolute beginners. It will teach the basics needed to be able to play other wargames. If you notice something essential is missing or have ideas for new levels, please let us know!

See more about [here][OTW-bandit].

## Init

You can use init command for bandit to setup the game:

```bash
otw bandit init
```

or manually:

Create a `bandit.env` file:

```bash
touch bandit.env
```

Add variables `BANDIT_HOST` with game indicated host and `BANDIT_PORT` with indicated port.

## Creating Solve Method

For each level you complete create a directory named `bandit<lvl-number>`, for exemple, if you complete the level 0, create the folder `bandit0`, for lvl 1, create directory `bandit1`, and so on.

create a `solve.sh` file in this folder and put a bash script that get the password for next lvl

> This script need have only the password as output, you may use grep, awk, tr, sed, or any form to exclude any trash that isn't the password.

for example: if a file `psswd.txt` with the password that will aways be in 4th line, you can use

```txt
trash1
trash2
trash3
asX26Gj9Kno0nBHJ3mk9jH6u&wJehJ8
trash4
trash5
trash6
```

you can use:

```bash
head -n 4 test.txt | tail -n 1
```

**Please note that the password will change over time**, so if you use a bash script searching with the exactly password text, it'll work, but you'll need to change your solve.sh for each password's change, that isn't the right form that it will need to be, so, use your brain.

> The `init` command also setup the first lvl

## Solving puzzle

To generate password, use:

```bash
otw bandit <lvl> solve
```

this will get the password stored in your lvl folder and apply the solving script, and put the new lvl password on your next lvl folder.

Make sure the `<lvl>` have your `bandit<lvl>/solve.sh` and your password stored in `bandit<lvl>/data.txt`.

## Connecting

To connect in a puzzle lvl, you may use:

```bash
otw bandit <lvl> connect
```

this will check for your password stored in `bandit<lvl>/data.txt` and will use it to connect to your lvl

<!-- Lins -->
[OTW-bandit]:<https://overthewire.org/wargames/bandit/>
