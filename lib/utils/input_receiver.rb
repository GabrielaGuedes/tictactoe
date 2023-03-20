# frozen_string_literal: true

module Utils
  class InputReceiver
    def self.valid_input(message, &validation_block)
      puts message
      input = gets.chomp
      return input if valid?(input) { |i| validation_block.call(i) }

      puts 'Invalid input, try again.'
      valid_input(message) { |i| validation_block.call(i) }
    end

    def self.valid?(input, &validation_block)
      validation_block.call(input)
    end
  end
end
