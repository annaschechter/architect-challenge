class Passenger

	def initialize(options={})
		@account = options[:account]
	end

	def travelling?
		@account > 2.00
	end

end