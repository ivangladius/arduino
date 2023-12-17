
FQBN := arduino:mbed_nano:nano33ble
PORT := /dev/ttyACM0

all: compile upload monitor

compile:
	arduino-cli compile --fqbn $(FQBN) . --output-dir build 
upload:
	arduino-cli upload -p $(PORT) --fqbn $(FQBN) . --input-dir build

monitor:
	arduino-cli monitor -p $(PORT)

NAME=main

project:
	arduino-cli sketch new $(NAME)
	mv $(NAME)/$(NAME).ino .
	rm -rf $(NAME)
	rm -rf README.md
	touch README.md
	rm -rf .git




