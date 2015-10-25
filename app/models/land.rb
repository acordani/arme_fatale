class Land < ActiveRecord::Base

  validates :number, presence:true
  validates :surface, presence: true
  validates :address, presence: true
  validates :neighborhood, presence: true
  validates :city, presence: true


  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Land.create! row.to_hash
     end
  end
end
