#!/usr/bin/env ruby

#
# Telephone number converter. This simple implementation
# delivers possibility to convert number into its string
# representation.
#
class TelephoneNumberConverter
  private_class_method :new

  class Invalid < StandardError; end

  def initialize(number)
    @number = number
  end

  #
  # Create number converter for given number. If
  # provided number is not valid (it is not composed
  # of 9 digits) than invalid exception is thrown.
  #
  def self.create!(number)
    new(number).tap do |tel_number|
      fail Invalid unless tel_number.valid?
    end
  end

  #
  # Convert number into its string representation.
  #
  def to_strings
    digits.inject(['']) do |results, digit|
      combinations(results, digit)
    end
  end

  #
  # Check if provided telephone number is valid.
  # Valid number is composed of 9 digiths - no more,
  # no less.
  #
  def valid?
    @number =~ /\A\d{9}\z/
  end

  private

  DIGIT_CHARS = {
    '1' => ['1'],
    '2' => %w(A B C),
    '3' => %w(D E F),
    '4' => %w(G H I),
    '5' => %w(J K L),
    '6' => %w(M N O),
    '7' => %w(P R S),
    '8' => %w(T U W),
    '9' => %w(V X Y),
    '0' => ['0']
  }

  def chars(digit)
    DIGIT_CHARS[digit]
  end

  def digits
    @number.split('')
  end

  def combinations(prefixes, digit)
    prefixes.map do |prefix|
      chars(digit).map { |char| prefix + char }
    end.flatten
  end
end

class Runner
  def self.run(args)
    begin
      number = TelephoneNumberConverter.create!(args[0])
      number.to_strings.each { |r| puts r }
    rescue
      puts 'ERROR'
    end
  end
end
