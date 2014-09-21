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

end
