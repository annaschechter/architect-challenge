require 'coach'


describe Coach do
  let(:coach) {Coach.new}
  let(:passenger) {double :passenger}
  let(:station) {double :station, :let_in => true, :let_out => true}

  def fill_up(coach)
      2.times{coach.board(station, passenger)}
  end

  it "should allow passengers to board the coach" do
     expect{coach.board(station, passenger)}.to change{coach.passenger_count}.by 1
  end

  it "should allow passengers alight the coach" do
     coach.board(station, passenger)
     expect{coach.alight(station, passenger)}.to change{coach.passenger_count}.by -1
  end

  it "should know when it's full" do
     fill_up(coach)
     expect(coach).to be_full
  end

  it "should not board passengers when it's full" do
     fill_up(coach)
     expect(lambda {coach.board(station, passenger)}).to raise_error "This coach is full. Please try the next one."
  end 

  it "should only allow to board those passengers who are at the station" do
     allow(station).to receive(:let_out).with passenger
     expect(lambda {coach.board(station, passenger)}).to raise_error "This passenger is not at the station"
  end

  it "should only allow to alight those passengers who are on the coach" do
    expect(lambda {coach.alight(station, passenger)}).to raise_error "This passenger is not on this coach"
  end

end