require 'station'

describe Station do 

	let(:station) {Station.new}
	let(:passenger) {double :passenger, :travelling? => true}
	let(:passenger1) {double :passenger, :travelling? => false}
	let(:train) {double :train}

	it "should be able to let in passengers" do 
		expect{station.let_in(passenger)}.to change{station.people_count}.by 1
	end

	it "should only let in passengers with account balance £2 or over" do
	   expect(lambda {station.let_in(passenger1)}).to raise_error "Not enough money on your account. Please top up."
	end

	it "should be able to let passengers out" do
		station.let_in(passenger)
		expect{station.let_out(passenger)}.to change{station.people_count}.by -1
	end

    it "should know if the passenger is at the station" do
        station.let_in(passenger)
        expect(station.contain?(passenger)).to be true
    end

    it "should know if the passenger is not at the station" do
        expect(station.contain?(passenger)).to be false
    end

	it "should only let people out if they are at the station" do
		expect(lambda {station.let_out(passenger)}).to raise_error "This passenger is not at the station"
	end

	it "should accept arriving train" do
		expect{station.accept_train(train)}.to change{station.train_count}. by 1
    end

    it "should release departing train" do
    	station.accept_train(train)
    	expect{station.release_train(train)}.to change{station.train_count}.by -1
    end

end