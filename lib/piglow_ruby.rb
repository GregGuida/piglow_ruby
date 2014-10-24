require "piglow_ruby/version"
require "i2c"

module PiglowRuby
     
    class Piglow
        DEVICE_ADDRESS = 0x54

        CMD_ENABLE_OUTPUT = 0x00
        CMD_ENABLE_LEDS = 0x13
        CMD_SET_PWM_VALUES = 0x01
        CMD_UPDATE = 0x16

        LEDS = [
            0x0B, 0x0D, 0x0A,
            0x0C, 0x0F, 0x05,
            0x0E, 0x04, 0x06,
            0x10, 0x03, 0x09,
            0x11, 0x02, 0x08,
            0x12, 0x01, 0x07
        ]

        COLORS = [:white, :blue, :green, :yellow, :orange, :red]
 
        def initialize
            @bus = I2C.create("/dev/i2c-1")

            # enable output
            @bus.write(DEVICE_ADDRESS, CMD_ENABLE_OUTPUT, 0x01)
        end

        def update
            @bus.write(DEVICE_ADDRESS, CMD_UPDATE, 0x0FF)
        end

        def led(led, value)
            @bus.write(DEVICE_ADDRESS, LEDS[led], value)
            update
        end

        def ring(ring, value)
            (0..2).each do |i|
                @bus.write(DEVICE_ADDRESS, LEDS[3*ring+i], value)
            end
            update
        end

        def color(color, value)
            (0..2).each do |i|
                @bus.write(DEVICE_ADDRESS, LEDS[3*COLORS.index(color)+i], value)
            end
            update
        end

        def leg(leg, value)
            LEDS.each_slice(3).each do |ring|
                @bus.write(DEVICE_ADDRESS, ring[leg], value)
            end
            update
        end

        def all(value)
            LEDS.each do |l|
                @bus.write(DEVICE_ADDRESS, l, value)
            end
            update
        end

        def clear
            all(0x00)
        end
    end
end
