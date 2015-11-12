require 'active_record'
require 'io/console'
require 'byebug'
require_relative 'contact'
require_relative 'phone'

class Application

  # ActiveRecord::Base.logger = Logger.new(STDOUT)

  class << self
    def main(args)
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

      case args[0]
      when 'help' then puts help
      when 'new' then new_contact
      when 'list' then list
      when 'show' then show(args[1])
      when 'find' then find(args[1])
      else
        puts "Invalid command"
      end

    end

    def help
      "Here is a list of available commands:
      new  - Create a new contact
      list - List all contacts
      show - Show a contact
      find - Find a contact"
    end

    def new_contact
      puts "Email?"
      email = STDIN.gets.chomp
      puts "First Name?"
      firstname = STDIN.gets.chomp
      puts "Last Name?"
      surname = STDIN.gets.chomp
      contact = Contact.create(firstname: firstname, lastname: surname, email: email)
      contact.errors.full_messages.each { |e| puts e } if contact.errors.any?
      add_phone(contact.id) unless contact.errors.any?
    end

    def add_phone(id)
      puts "Would you like to link a phone number? y/n"
      reply = STDIN.gets.chomp
      if reply == 'y'
        puts "Phone Number?"
        number = STDIN.gets.chomp
        puts "Label for this number?"
        label = STDIN.gets.chomp
        phone = Phone.create(numbers: number, label: label, contact_id: id)
        phone.errors.full_messages.each { |e| puts e } if phone.errors.any?
        add_phone(id) unless phone.errors.any?
      end
    end

    def list
      display_page(Contact.all.to_a)
    end

    def show(id)
      begin
        print_contact(Contact.find(id))
      rescue ActiveRecord::RecordNotFound
        puts "No contact with that id was found"
      end
    end

    def find(term)
      result = Contact.where('firstname LIKE ? OR lastname LIKE ? OR email like ?', "%#{term}%", "%#{term}%", "%#{term}%")
      display_page(result.to_a)
    end

    private
    def display_page(array)
      page = array.shift(5)
      page.each { |contact| print_contact(contact) }
      until array.empty?
        puts "-------Press space to see more-------"
        display_page(array) if STDIN.getch == ' '
      end
    end

    def print_contact(contact)
      puts contact.to_s
    end

  end

end

if $0 == __FILE__
  Application.main(ARGV)
end