require 'rails_helper'

RSpec.describe User, type: :model do


	it "is not valid without a name"  do
		user = User.new
		expect(user).not_to be_valid
	end

	it "is not valid with a name longer than 100 symbols"  do
		user = User.new(name: 'a' * 101)
		expect(user).not_to be_valid
	end

	it "is valid with proper data" do
		user = User.new(name: 'a' * 50)
		expect(user).not_to be_valid
	end
		
end