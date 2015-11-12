class Contact < ActiveRecord::Base
  validates :email, uniqueness: true, presence: true
  validates :firstname, presence: true
  validates :lastname, presence: true
  has_many :phones

  def to_s
    contact_info =  "#{firstname} #{lastname}: #{email}"
      if phones.length > 0
        phones.each do |phone|
          contact_info << " #{phone.label}: #{phone.numbers} "
        end
      end
    contact_info
  end
end