class Contact
 
  attr_accessor :name, :email, :digits

  def initialize(name, email, digits)
    # TODO: assign local variables to instance variables
    @name = name
    @email = email
    @digits = digits
  end
 
  def to_s
    # TODO: return string representation of Contact
  end
 
  ## Class Methods
  class << self
    def create(name, email, digits)
      # TODO: Will initialize a contact as well as add it to the list of contacts
      contact = Contact.new(name, email, digits)
      cd = ContactDatabase.new
      idx = 0
      idx = cd.read_all.last[0] unless cd.read_all.empty?
      cd.create(contact, idx.to_i + 1)
    end
 
    def find(term)
      # TODO: Will find and return contacts that contain the term in the first name, last name or email
      ContactDatabase.new.read_all.select { |con| con.join(" ").include?(term) }
    end
 
    def all
      # TODO: Return the list of contacts, as is
      ContactDatabase.new.read_all
    end
    
    def show(id)
      # TODO: Show a contact, based on ID
      not_found = "That contact doesn't exist"
      ContactDatabase.new.read_all.find(not_found) { |con| con[0].eql?(id) }
    end
  end
end