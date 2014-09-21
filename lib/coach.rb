require_relative 'station'
require_relative 'passenger'

class Coach

  def initialize
    @coach = []
  end

  def passenger_count
  	@coach.count
  end

  def board(station, passenger)
  	if station.let_out(passenger) == nil
  		raise "This passenger is not at #{station}"
  	else
       @coach << passenger
    end	
  end

  def alight(station, passenger)
  	if @coach.delete(passenger) == nil
  		raise "This passenger is not on this coach"
  	else 
  	   station.let_in(passenger)
  	end 	
  end

end