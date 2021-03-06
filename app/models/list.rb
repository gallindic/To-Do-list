class List < ActiveRecord::Base
  belongs_to :user
  has_many :tasks, dependent: :destroy
  
  validates :name, presence: true, length: { maximum: 100 }
  validates :user_id, presence: true

end
