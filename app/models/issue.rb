class Issue < ActiveRecord::Base
	validates :title, presence: true

	belongs_to :user
	has_many :comments

end
