require 'passenger'
require 'station'

describe Passenger do 

	it "should be able to travel with over £2" do
       passenger = Passenger.new(:account => 2.50)
       expect(passenger).to be_travelling
    end  

    it "should not be able to travel with £2 and under" do
    	passenger = Passenger.new(:account => 1)
    	expect(passenger).to_not be_travelling
    end

    it "should be able to enter a station with account ballance over £2" do
    	passenger = Passenger.new(:account => 2.50)
    	station = Station.new
    	expect(station.passenger_count).to eq(0)
    	passenger.touch_in(station)
        expect(station.passenger_count).to eq(1)
    end

    it "should be able to leave a station" do
    	passenger = Passenger.new(:account => 2.50)
    	station = Station.new
    	expect(station.passenger_count).to eq(0)
    	passenger.touch_in(station)
    	passenger.touch_out(station)
    	expect(station.passenger_count).to eq(0)
    end

end