require 'station'
require 'train'

describe Passenger do 

    let(:passenger1) {Passenger.new(:account => 3.00)}
    let(:passenger2) {Passenger.new(:account => 1.00)}
    let(:station) {Station.new}
    let(:train) {Train.new(3)}

    it "should be able to travel with over £2" do
       expect(passenger1).to be_travelling
    end  

    it "should not be able to travel with £2 and under" do
        expect(passenger2).to_not be_travelling
    end

    it "should be able to enter a station with account ballance over £2" do
        expect(station.passenger_count).to eq(0)
        passenger1.touch_in(station)
        expect(station.passenger_count).to eq(1)
    end

    it "should be able to leave a station" do
        expect(station.passenger_count).to eq(0)
        passenger1.touch_in(station)
        passenger1.touch_out(station)
        expect(station.passenger_count).to eq(0)
    end

    it "should have 0.00 default account balance" do
        passenger = Passenger.new
        expect(passenger).to_not be_travelling
    end

    it "should be able to board the train" do
        station.let_in(passenger1)
        station.arrive(train)
        passenger1.board_train(station, train)
        expect(station.passenger_count).to eq(0)
    end 

    it "should only be able to board a train if passsenger is at the station" do
        station.arrive(train)
        expect(lambda {passenger1.board_train(station, train)}).to raise_error(RuntimeError)
    end

    it "should only be able to board a train is the train is at the station" do
        passenger1.touch_in(station)
        expect(lambda {passenger1.board_train(station, train)}).to raise_error(RuntimeError)
    end

    it "if the coach is full should be able to board the next coach" do
        passenger3 = Passenger.new(:account => 5)
        passenger4 = Passenger.new(:account => 5)
        passenger1.touch_in(station)
        passenger3.touch_in(station)
        passenger4.touch_in(station)
        station.arrive(train)
        passenger1.board_train(station, train)
        passenger3.board_train(station, train)
        passenger4.board_train(station, train)
        expect(train.coaches[0]).to be_full
        expect(train.coaches[1].passenger_count).to eq(1)
    end

    it "should be able to alight train" do
        station.let_in(passenger1)
        station.arrive(train)
        passenger1.board_train(station, train)
        passenger1.alight_train(station, train)
        expect(station.passenger_count).to eq(1)
    end

    it "should only be able to alight train if passenger is on the train" do
        station.arrive(train)
        expect(lambda {passenger1.alight_train(station, train)}).to raise_error(RuntimeError)
    end

    it "should only be able to alight train is the train is at the station" do
        passenger1.touch_in(station)
        expect(lambda {passenger1.alight_train(station, train)}).to raise_error(RuntimeError)
    end

    it "should be able to alight train from any coach" do
        passenger3 = Passenger.new(:account => 5)
        passenger4 = Passenger.new(:account => 5)
        passenger1.touch_in(station)
        passenger3.touch_in(station)
        passenger4.touch_in(station)
        station.arrive(train)
        passenger1.board_train(station, train)
        passenger3.board_train(station, train)
        passenger4.board_train(station, train)
        station.depart(train)
        station2 = Station.new
        station2.arrive(train)
        passenger4.alight_train(station2, train)
        expect(train.coaches[1].passenger_count).to eq(0)
    end
end