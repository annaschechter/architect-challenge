class Passenger

	def initialize(options={})
		@account = options[:account]
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

end