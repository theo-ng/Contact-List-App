class Contact < ActiveRecord::Base
  validates :email, uniqueness: true, presence: true
  has_many :phones
end