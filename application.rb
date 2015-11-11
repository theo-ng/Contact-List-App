require 'active_record'
require_relative 'contact'
require_relative 'phone'

class Application

  ActiveRecord::Base.logger = Logger.new(STDOUT)

  def self.main
    ActiveRecord::Base.establish_connection(
      adapter: 'postgresql',
      database: 'contacts',
      username: 'theo',
      password: 'panda',
      host: 'localhost',
      port: 5432,
      pool: 5,
      encoding: 'unicode',
      min_messages: 'error'
      )
    puts 'Connected!'

    # contact = Contact.new(firstname: 'Bob', lastname: 'Orr', email: 'orr04@gmail.com')
    # contact.save
    # p Contact.all.last
    # theo.firstname = 'Ted'
    # theo.save
    # theo.destroy
    puts Contact.find(3).inspect
    # puts Contact.find_all_by_lastname('Ng').inspect
    # puts Contact.find_all_by_firstname('Theo').inspect
    puts Contact.find_by_email('theo@gmail.com').inspect
    puts Phone.find(2).inspect
    theo = Contact.find(5)
    puts theo.phones
  end
end

Application.main