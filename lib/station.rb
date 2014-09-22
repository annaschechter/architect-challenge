class Station

	def initialize
		@people = []
		@trains = []
	end

	def people
		@people
	end

	def trains
		@trains
	end

	def passenger_count
		@people.count
	end

	def train_count
		@trains.count
	end

	def let_in(passenger)
		raise "Not enough money on your account. Please top up." unless passenger.travelling? 
		@people << passenger
	end

	def let_out(passenger)
		raise "This passenger is not at the station" unless people.include?(passenger)
		@people.delete(passenger)
	end

	def arrive(train)
		@trains << train
	end

	def depart(train)
		raise "This train is not at the station." if @trains.delete(train) == nil	
	end

end