class Location < ActiveRecord::Base
  belongs_to :locatable, polymorphic: true

  geocoded_by :address
  reverse_geocoded_by :latitude, :longitude

  before_validation :geocode, if: :needs_geocoding?
  before_validation :reverse_geocode, if: :needs_reverse_geocoding?

  validates :latitude,
  presence: true,
  :numericality => {
    :greater_than_or_equal_to => -90.0,
    :less_than_or_equal_to => +90.0
  }

  validates :longitude,
  presence: true,
  :numericality => {
    :greater_than_or_equal_to => -180.0,
    :less_than_or_equal_to => +180.0
  }

  private
  def needs_geocoding?
    address && !(latitude && longitude)
  end

  def needs_reverse_geocoding?
    (latitude && longitude) && !address
  end

end
