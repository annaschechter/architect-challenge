require 'station'

describe Station do 

	let(:station) {Station.new}

	it "should be able let in passengers" do 
		expect(station.passenger_count).to eq(0)
		station.let_in(Passenger.new(:account => 3))
		expect(station.passenger_count).to eq(1)
	end

	it "should only let in passengers with account balance £2 or over" do
	   passenger = Passenger.new(:account => 1.5)
	   expect(lambda {station.let_in(passenger)}).to raise_error(RuntimeError)
	end
	
end