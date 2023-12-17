
FQBN := arduino:mbed_nano:nano33ble
PORT := /dev/ttyACM0

all: compile upload monitor

compile:
	arduino-cli compile --fqbn $(FQBN) . --output-dir build 
upload:
	arduino-cli upload -p $(PORT) --fqbn $(FQBN) . --input-dir build

monitor:
	arduino-cli monitor -p $(PORT)

project:
	arduino-cli sketch new $(NAME)
	cp makefile $(NAME)/makefile
	mv README.me $(NAME)/README.me
	rm -rf .git
	mkdir $(NAME)/src
	mv $(NAME)/$(NAME).ino $(NAME)/src/$(NAME).ino
	rm makefile



