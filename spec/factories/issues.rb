FactoryGirl.define do
	factory :issue do
		sequence(:title){|n| "Problem #{n}" }
		details "Big Problem"
		snapshot {File.open(File.join(Rails.root, '/spec/support/images/test-image.jpg'))}

		user
	end
end