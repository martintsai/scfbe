class Issue < ActiveRecord::Base
  mount_uploader :snapshot, SnapshotUploader
	belongs_to :user
	has_many :comments

  # validates :title, :snapshot, presence: true
  validates :title, presence: true
end
