class Restuarant < ActiveRecord::Base
  belongs_to :user
  has_many :reviews, dependent: :destroy

  validates :name, presence: true, uniqueness: true

end