require 'rails_helper'

describe User do
	# it "is valid with a firstname, lastname, email, username"
	it "is invalid without a firstname" do
		user = User.new(firstname: "")
		user.valid?
		expect(user.errors[:firstname]).to include("can't be blank")
	end

	it "does not allow duplicate email address per user" do
		User.create(firstname: 'Tobias', lastname: 'Pan', gender: 'male', country: '中國', church: "上海", email: "test@test.com", username: 'hitobias', password: 'foobar', password_confirmation: 'foobar')
		user = User.create(firstname: 'Tobias', lastname: 'Pan', gender: 'male', country: '中國', church: "上海", email: "test@test.com", username: 'hitobias', password: 'foobar', password_confirmation: 'foobar')
		user.valid?
		expect(user.errors[:email]).to include('has already been taken')
	end

	it "is invalid password confirmation does not same as password" do
		user = User.create(firstname: 'Tobias', lastname: 'Pan', gender: 'male', country: '中國', church: "上海", email: "test123@test.com", username: 'hitobias123', password: 'foobar', password_confirmation: 'barfoo')
		user.valid?
		expect(user.errors[:password_confirmation]).to include('doesn\'t match Password')
	end

	it "is invalid password's length < 6" do
		user = User.create(firstname: 'Tobias3', lastname: 'Pan3', gender: 'male', country: '中國', church: "上海", email: "test1243@test.com", username: 'hitobias12323', password: "fooba", password_confirmation: "fooba")
		expect(user.errors[:password]).to include('is')
	end
end