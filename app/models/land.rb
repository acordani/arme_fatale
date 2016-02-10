class Land < ActiveRecord::Base

  validates :number, presence:true
  validates :surface, presence: true
  validates :address, presence: true
  validates :neighborhood, presence: true
  validates :city, presence: true
  validates :file, presence:true

  has_many :comments



  geocoded_by :full_street_address
  after_validation :geocode, if: :address_changed?

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Land.create! row.to_hash
     end
  end

  def full_street_address
    [address, city].compact.join(', ')
  end

end

