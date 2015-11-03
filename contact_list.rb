require 'optparse'
require_relative 'contact'
require_relative 'contact_database'
require 'byebug'

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
      when 'list' then list
      when 'show' then show(args[1])
      when 'find' then find(args[1])
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
      name = STDIN.gets.chomp
      puts "Email?"
      email = STDIN.gets.chomp
      Contact.create(name,email)
    end

    def list
      Contact.all.each { |con| puts "#{con[0]}: #{con[1]} (#{con[2]})" }
    end

    def show(id)
      # display details of contact[:id]
      puts Contact.show(id)
    end

    def find(term)
      puts Contact.find(term)
    end
  end
end

if $0 == __FILE__
  ContactList.main(ARGV)
end