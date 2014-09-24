require_relative 'station'

class Train

  attr_reader :coaches

  def initialize(number=1)
  	  @coaches = []
      number.times{@coaches << Coach.new}
  end

  def coach_count
  	  @coaches.count
  end

end