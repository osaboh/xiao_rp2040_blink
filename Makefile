TARGET=xiao_rp2040_blink
FQBN=rp2040:rp2040:seeed_xiao_rp2040
SERIAL_DEV=/dev/cu.usbmodem1101
BUILD=build
ELF=$(BUILD)/$(TARGET).ino.elf

all: $(ELF)

$(ELF): $(TARGET).ino
	arduino-cli compile --fqbn $(FQBN) --build-path $(BUILD)

flash: $(ELF)
	arduino-cli upload --port $(SERIAL_DEV) --fqbn $(FQBN) .

clean:
	rm -rf $(BUILD)

arduino-cli-setup:
	arduino-cli config init
	arduino-cli config add board_manager.additional_urls https://github.com/earlephilhower/arduino-pico/releases/download/global/package_rp2040_index.json
	arduino-cli core update-index
	arduino-cli board list
#	arduino-cli sketch new <PROJECT_NAME>
