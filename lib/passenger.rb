require_relative 'train'
require_relative 'coach'
require_relative 'station'

class Passenger

    DEFAULT_ACCOUNT = 0.00
     
	def initialize(options={})
		@account = options[:account] || DEFAULT_ACCOUNT
	end

	def travelling?
		@account > 2.00
	end

	def touch_in(station)
		station.let_in(self)
	end

	def touch_out(station)
		station.let_out(self)
	end

    def board_train(station, train)
        raise "This train is not at the station." unless station.trains.include?(train)
  	 	num = 0        
  	 	
  	    if train.coaches[num].full?
  	    	while train.coaches[num].full?
               num += 1
               train.coaches[num].board(station, self)
            end
        else
            train.coaches[num].board(station, self)
        end 
   end

  def alight_train(station, train)
     raise "This train is not at the station." unless station.trains.include?(train)
     	train.coaches.each do 
     		|coach| coach.alight(station, self) if coach.passengers.include?(self)
     	end
      raise "This passenger is not on this train" unless station.people.include?(self)
  end
end