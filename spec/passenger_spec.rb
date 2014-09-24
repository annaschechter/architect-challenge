require 'passenger'


describe Passenger do  

    let(:passenger1) {Passenger.new(:account => 2.01)}
    let(:passenger2) {Passenger.new(:account => 2.00)}
    let(:station) {Station.new}
    let(:train) {Train.new(3)}

  def fill_up_coach(coach)
      40.times{
        person = Passenger.new(:account => 3.00)
        person.touch_in(station) 
        coach.board_for_coach(station, person)}
  end

    it "should be able to travel with over £2" do
       expect(passenger1).to be_travelling
    end  

    it "should not be able to travel with £2 and under" do
        expect(passenger2).to_not be_travelling
    end

    it "should be able to touch in to enter the station with account ballance over £2" do
        passenger1.touch_in(station)
        expect(passenger1).to be_at_station(station)
    end

    it "should be able to touch out to leave the station" do
        passenger1.touch_in(station)
        passenger1.touch_out(station)
        expect(passenger1).to_not be_at_station(station)
    end


    it "should have 0.00 default account balance" do
        passenger = Passenger.new
        expect(passenger).to_not be_travelling
    end

    it "should be able to board the train" do
        station.let_in(passenger1)
        station.accept_train(train)
        passenger1.board_train(station, train)
        expect(station.people_count).to eq(0)
    end 

    it "should only be able to board a train if passsenger is at the station" do
        station.accept_train(train)
        expect(lambda {passenger1.board_train(station, train)}).to raise_error(RuntimeError)
    end

    it "should only be able to board a train is the train is at the station" do
        passenger1.touch_in(station)
        expect(lambda {passenger1.board_train(station, train)}).to raise_error(RuntimeError)
    end

    it "if the coach is full should be able to board the next coach" do
        passenger1.touch_in(station)
        station.accept_train(train)
        fill_up_coach(train.coaches[0])
        passenger1.board_train(station, train)
        expect(train.coaches[1].passenger_count).to eq(1)
    end

    it "should be able to alight train" do
        station.let_in(passenger1)
        station.accept_train(train)
        passenger1.board_train(station, train)
        passenger1.alight_train(station, train)
        expect(station.people_count).to eq(1)
    end

    it "should only be able to alight train if passenger is on the train" do
        station.accept_train(train)
        expect(lambda {passenger1.alight_train(station, train)}).to raise_error(RuntimeError)
    end

    it "should only be able to alight train is the train is at the station" do
        passenger1.touch_in(station)
        expect(lambda {passenger1.alight_train(station, train)}).to raise_error(RuntimeError)
    end

    it "should be able to alight train from any coach" do
        passenger1.touch_in(station)
        station.accept_train(train)
        fill_up_coach(train.coaches[0])
        passenger1.board_train(station, train)
        station.release_train(train)
        station2 = Station.new
        station2.accept_train(train)
        passenger1.alight_train(station2, train)
        expect(train.coaches[1].passenger_count).to eq(0)
    end
end