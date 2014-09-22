
class Coach

  def initialize
    @passengers = []
  end

  def passengers
    @passengers
  end

  def passenger_count
    passengers.count
  end

  def full?
    passenger_count >= 2
  end

  def board(station, passenger)
     raise "This coach is full. Please try the next one." if full?
      if station.let_out(passenger) == nil
        raise "This passenger is not at the station"
      else
          @passengers << passenger
      end 
  end

  def alight(station, passenger)
    if @passengers.delete(passenger) == nil
      raise "This passenger is not on this coach"
    else 
       station.let_in(passenger)
    end   
  end
end