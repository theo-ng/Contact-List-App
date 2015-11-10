require 'pg'
require 'byebug'
require_relative 'contact'

class Main

  def self.main
    # theo = Contact.new('Theo', 'Ng', 'theo@gmail.com')
    # theo.save
    # theo.firstname = 'Ted'
    # theo.save
    # theo.destroy
    puts Contact.find_by_email('theo@gmail.com').inspect

  end

end

Main.main