require 'coach'


describe Coach do
  let(:coach) {Coach.new}
  let(:passenger) {Passenger.new(:account => 5.50)}
  let(:station) {Station.new}

  it "should allow passengers to board the coach" do
   expect(coach.passenger_count).to eq(0)
   station.let_in(passenger)
   coach.board(station, passenger)
   expect(coach.passenger_count).to eq(1)
  end

  it "should allow passengers alight the coach" do
   station.let_in(passenger)
   coach.board(station, passenger)
   coach.alight(station, passenger)
   expect(coach.passenger_count).to eq(0)
  end

  it "should know when it's full" do
    expect(coach).to_not be_full
    passenger1 = Passenger.new(:account => 5)
    passenger2 = Passenger.new(:account => 5)
    station.let_in(passenger1)
    station.let_in(passenger2)
    coach.board(station, passenger1)
    coach.board(station, passenger2)
    expect(coach).to be_full
  end

  it "should not board passengers when it's full" do
    expect(coach).to_not be_full
    passenger1 = Passenger.new(:account => 5)
    passenger2 = Passenger.new(:account => 5)
    passenger3 = Passenger.new(:account => 5)
    station.let_in(passenger1)
    station.let_in(passenger2)
    station.let_in(passenger3)
    coach.board(station, passenger1)
    coach.board(station, passenger2)
    expect(lambda {coach.board(station, passenger3)}).to raise_error(RuntimeError)
  end 

  it "should only allow to board those passengers who are at the station" do
       expect(lambda {coach.board(station, passenger)}).to raise_error(RuntimeError)
  end

  it "should only allow to alight those passengers who are on the coach" do
    expect(lambda {coach.alight(station, passenger)}).to raise_error(RuntimeError)
  end
end
