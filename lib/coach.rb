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
  	  if full?
  		 raise "This coach is full. Please try the next one."
  	  else
  	        if station.let_out(passenger) == nil
  		      raise "This passenger is not at the station"
  	        else
              @coach << passenger
            end
      end	
  end

  def alight(station, passenger)
  	if @coach.delete(passenger) == nil
  		raise "This passenger is not on this coach"
  	else 
  	   station.let_in(passenger)
  	end 	
  end

  def full?
  	passenger_count > 2
  end

end