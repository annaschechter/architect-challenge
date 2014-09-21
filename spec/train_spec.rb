require 'train'

describe Train do 

	let(:train) {Train.new(5)}

	it "should consist of a number of coaches" do
		expect(train.coach_count).to eq(5)
	end



	
end