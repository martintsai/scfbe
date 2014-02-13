class Issue < ActiveRecord::Base

	belongs_to :user

	has_many :comments

  mount_uploader :snapshot, SnapshotUploader

  validates :title, :snapshot, presence: true
	
	

end
