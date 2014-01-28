class Issue < ActiveRecord::Base
	validates :title, presence: true
	belongs_to :user
  mount_uploader :snapshot, SnapshotUploader
end
