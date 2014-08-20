class Flat < ActiveRecord::Base
  has_many :pics, dependent: :destroy
  belongs_to :user
end
