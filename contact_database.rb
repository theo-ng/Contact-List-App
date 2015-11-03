## TODO: Implement CSV reading/writing
require 'csv'

class ContactDatabase

  PATH = 'contacts.csv'

  def read_all
    contacts = []
    CSV.read(PATH).each do |row|
      contacts << row
    end
    contacts
  end

  def create(contact, index)
    # byebug
    CSV.open(PATH, "a") do |csv|
      # byebug
      csv << [index, contact.name, contact.email]
    end
  end
end

# me = ["Theo Ng", "theo@lhl.ca"]
# ContactDatabase.new.create(me,)