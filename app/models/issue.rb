class Issue < ActiveRecord::Base
	validates :title, presence: true
	belongs_to :user

	has_many :comments

  mount_uploader :snapshot, SnapshotUploader

end
