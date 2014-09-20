require 'passenger'

describe Passenger do 

	it "should be able to travel with over £2" do
       passenger = Passenger.new(:account => 2.50)
       expect(passenger).to be_travelling
    end  

    it "should not be able to travel with £2 and under" do
    	passenger = Passenger.new(:account => 1)
    	expect(passenger).to_not be_travelling
    end
	
end