class Issue < ActiveRecord::Base
  mount_uploader :snapshot, SnapshotUploader
	belongs_to :user
	has_many :comments
  has_one :location, as: :locatable, dependent: :destroy

  # validates :title, :snapshot, presence: true
  validates :title, presence: true

  accepts_nested_attributes_for :location
  delegate :address, :latitude, :longitude, to: :location
end
