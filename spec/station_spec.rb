require 'station'

describe Station do 

	let(:station) {Station.new}
	let(:passenger) {Passenger.new(:account => 5.00)}
	let(:train) {Train.new(3)}

	it "should be able to let in passengers" do 
		expect(station.passenger_count).to eq(0)
		station.let_in(passenger)
		expect(station.passenger_count).to eq(1)
	end

	it "should only let in passengers with account balance £2 or over" do
	   passenger = Passenger.new(:account => 1.5)
	   expect(lambda {station.let_in(passenger)}).to raise_error(RuntimeError)
	end

	it "should be able to let passengers out" do
		expect(station.passenger_count).to eq(0)
		station.let_in(passenger)
		station.let_out(passenger)
		expect(station.passenger_count).to eq(0)
	end

	it "should only let people out if they are at the station" do
		expect(lambda {station.let_out(passenger)}).to raise_error
	end

	it "should accept arriving train" do
		expect(station.train_count).to eq(0)
		station.arrive(train)
		expect(station.train_count).to eq(1)
    end

    it "should release departing train" do
    	expect(station.train_count).to eq(0)
    	station.arrive(train)
    	station.depart(train)
    	expect(station.train_count).to eq(0)
    end

end