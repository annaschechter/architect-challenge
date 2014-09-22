require_relative 'coach'

class Train

  def initialize(number=1)
  	@coaches = Array.new(number) {Coach.new}
  end

  def coaches
  	@coaches
  end

  def coach_count
  	@coaches.count
  end

end