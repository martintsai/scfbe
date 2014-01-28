FactoryGirl.define do
	factory :issue do
		sequence(:title){|n| "Problem #{n}" }
		details "Big Problem"

		user
	end
end