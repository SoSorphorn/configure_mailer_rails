class Product < ApplicationRecord
	mount_uploader :file, FilesUploader
  belongs_to :user, optional: true
end