require_relative 'coach'

class Train

  def initialize(number)
  	@coaches = []
  	number.times {@coaches.push(Coach.new)}
  end

  def coach_count
  	@coaches.count
  end

end