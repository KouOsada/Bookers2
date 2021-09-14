class Book < ApplicationRecord

  belongs_to :user

  validates :title, presence: true
  validates :opinion, presence: true, length: { maximum: 200, allow_blank: true}

end
