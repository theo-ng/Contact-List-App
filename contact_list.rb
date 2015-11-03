require 'optparse'
require_relative 'contact'
require_relative 'contact_database'

# TODO: Implement command line interaction
# This should be the only file where you use puts and gets

# options = {}
# OptionParser.new do |opts|
#   opts.banner = "Usage: example.rb [options]"
# end
class ContactList

  @contacts = []

  class << self
    def main(args)
      case args[0]
      when 'help' then puts help
      when 'new' then new_contact
      when 'list'
        #List all contacts
      when 'show'
        #Show a contact
      when 'find'
        #Find a contact
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
      puts "Full Name?"
      name = gets.chomp
      puts "Email?"
      email = gets.chomp
      contact = Contact.create(name,email)
      conacts << contact
    end
  end
end

if $0 == __FILE__
  ContactList.main(ARGV)
end