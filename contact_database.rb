## TODO: Implement CSV reading/writing
require 'csv'
require 'byebug'

class ContactDatabase

  PATH = 'contacts.csv'.freeze

  def read_all
    contacts = []
    CSV.read(PATH).each do |row|
      row[3] = read_phones(row[3]) unless row[3] == nil
      contacts << row
    end
    # byebug
    contacts
  end

  def write(contact, index)
    # byebug
    CSV.open(PATH, "at") do |csv|
      # byebug
      csv << [index, contact.name, contact.email, convert_phones(contact.phone_numbers).join(',')]
    end
  end

  private
  def convert_phones(numbers)
    numbers.flatten
  end

  def read_phones(numbers)
    Hash[*numbers.split(',')]
  end
end