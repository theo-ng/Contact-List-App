require 'pg'
require 'byebug'
require_relative 'contact'
require_relative 'phones'

class Main

  def self.main
    # theo = Contact.new('Theo', 'Ng', 'theo@gmail.com')
    # theo.save
    # theo.firstname = 'Ted'
    # theo.save
    # theo.destroy
    # puts Contact.find(3).inspect
    # puts Contact.find_all_by_lastname('Ng').inspect
    # puts Contact.find_all_by_firstname('Theo').inspect
    # puts Contact.find_by_email('theo@gmail.com').inspect
    # puts Phones.find(2).inspect
    theo = Contact.find(5)
    puts theo.phones
  end

end

Main.main