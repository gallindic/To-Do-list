class Task < ActiveRecord::Base
  belongs_to :list

  mount_uploader :image, ImageUploader
end
