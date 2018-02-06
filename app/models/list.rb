class List < ActiveRecord::Base
  belongs_to :user
  belongs_to :type
  
  validates :name, presence: true, length: { maximum: 100 }
  validates :user_id, presence: true
  validates :type_id, presence: true
end
