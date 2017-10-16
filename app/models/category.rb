class Category < ApplicationRecord
  validates :title, presence: true, uniqueness: true

  has_many :jobs
  belongs_to :company
end
