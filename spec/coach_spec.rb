require 'coach'


describe Coach do
  let(:coach) {Coach.new}
  let(:passenger1) {double :passenger, :at_station? => true}
  let(:passenger2) {double :passenger, :at_station? => false}
  let(:station1) {double :station, :let_in => true, :contain? =>true, :let_out =>false}
  let(:station2) {double :station, :let_in => true, :contain? =>false, :let_out =>true}
  

  def fill_up(coach)
      40.times{coach.board_for_coach(station1, passenger1)}
  end

  it "should allow passengers to board" do
     expect{coach.board_for_coach(station1, passenger1)}.to change{coach.passenger_count}.by 1
  end

  it "should allow passengers alight" do
     coach.board_for_coach(station1, passenger1)
     expect{coach.alight(station1, passenger1)}.to change{coach.passenger_count}.by -1
  end


  it "should know when it's full" do
     fill_up(coach)
     expect(coach).to be_full
  end

  it "should not board passengers when it's full" do
     fill_up(coach)
     expect(lambda {coach.board_for_coach(station1, passenger1)}).to raise_error "This coach is full. Please try the next one."
  end 

  it "should only allow to alight those passengers who are on the coach" do
    expect(lambda {coach.alight(station2, passenger2)}).to raise_error "This passenger is not on this coach"
  end

end