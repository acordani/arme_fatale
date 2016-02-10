class Comment < ActiveRecord::Base
  belongs_to :land
  belongs_to :user
end
