#!/usr/bin/env ruby

require 'optparse'
require_relative 'contact'
require_relative 'contact_database'
require 'byebug'
require 'io/console'

# TODO: Implement command line interaction
# This should be the only file where you use puts and gets

# options = {}
# OptionParser.new do |opts|
#   opts.banner = "Usage: example.rb [options]"
# end
class ContactList

  class DuplicateEntryError < StandardError
  end

  @contacts = []

  class << self

    def main(args)
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
      begin
        puts "Email?"
        email = STDIN.gets.chomp
        if exists?(email)
          raise DuplicateEntryError 
        else
          puts "Full Name?"
          name = STDIN.gets.chomp
          
          digits = add_phone({})
          Contact.create(name, email, digits)
        end
      rescue DuplicateEntryError
        puts "Email already in use!"
      end
    end

    def list
      display_5(Contact.all)
    end

    def show(id)
      # display details of contact[:id]
      print_contact(Contact.show(id))
    end

    def find(term)
      display_5(Contact.find(term))
    end

    private
    def display_5(array)
      page = array.shift(5)
      page.each { |contact| print_contact(contact) }
      unless array.empty?
        puts "-------Press space to see more-------"
        if STDIN.getch == ' '
          display_5(array)
        end
      end
    end

    def print_contact(contact)
      contact_info =  "#{contact[0]}: #{contact[1]} (#{contact[2]})"
      unless contact[3] == nil
        contact[3].each do |k,v|
          contact_info << " #{v}: #{k} "
        end
      end
      puts contact_info
    end

    def exists?(email)
      exists = false
      Contact.all.each do |contact|
        exists = true if contact[2] == (email)
      end
      exists
    end

    def add_phone(digits)
      puts "Would you like to link a phone number? y/n"
      reply = STDIN.gets.chomp
      if reply == 'y'
        puts "Phone Number?"
        number = STDIN.gets.chomp
        puts "Label for this number?"
        label = STDIN.gets.chomp
        digits[number] = label
        add_phone(digits)
      else
        digits
      end
    end
  end
end

if $0 == __FILE__
  ContactList.main(ARGV)
end