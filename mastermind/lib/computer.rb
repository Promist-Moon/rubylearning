# computer generates unique code
require_relative 'colours'

class Computer
  def initialize
    @code = Array.new(4, 0)
  end

  def generate_code
    4.times do |i|
      int = 1 + rand(6)
      @code[i] = Colours::COLOURS[int]
    end
  end

  attr_reader :code
end