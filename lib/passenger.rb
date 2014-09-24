require_relative 'station'
require_relative 'coach'
require_relative 'train'

class Passenger

    DEFAULT_ACCOUNT = 0.00
     
	def initialize(options={})
		@account = options[:account] || DEFAULT_ACCOUNT
	end

	def travelling?
		@account > 2.00
	end

	def at_station?(station)
		station.contain?(self)
	end


	def touch_in(station)
		station.let_in(self)
	end

	def touch_out(station)
		station.let_out(self)
	end

    def board_train(station, train)
        raise "This train is not at the station." unless station.has?(train)
  	 	num = 0        
  	    train.coaches[num].board_for_coach(station, self) unless train.coaches[num].full?
  	    while train.coaches[num].full?
            num += 1
            train.coaches[num].board_for_coach(station, self)
        end
    end
  

    def alight_train(station, train)
        raise "This train is not at the station." unless station.has?(train)
        train.coaches.each {|coach| coach.alight(station, self) if coach.passengers.include?(self)}
        raise "This passenger is not on this train" unless self.at_station?(station)
    end
end