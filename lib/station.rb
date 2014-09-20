class Station

	def initialize
		@people = []
	end

	def passenger_count
		@people.count
	end

	def let_in(passenger)
		raise "Not enough money on your account. Please top up." unless passenger.travelling? 
		@people << passenger
	end

	def let_out(passenger)
		@people.delete(passenger)
	end
	
end