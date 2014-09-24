require_relative 'station'

class Coach

  attr_reader :passengers

  def initialize
      @passengers = []
  end

  def passenger_count
      @passengers.count
  end

  def full?
      passenger_count >= 40
  end

  def board_for_coach(station, passenger)
      raise "This coach is full. Please try the next one." if full?
      @passengers << passenger
      station.let_out(passenger)
  end

  def alight(station, passenger)
      raise "This passenger is not on this coach" if @passengers.delete(passenger) == nil 
      station.let_in(passenger)  
  end

end