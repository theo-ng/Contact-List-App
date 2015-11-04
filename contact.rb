class Contact
 
  attr_accessor :name, :email, :phone_numbers

  def initialize(name, email, phone_numbers)
    @name = name
    @email = email
    @phone_numbers = phone_numbers
  end
 
  def to_s
    contact_info =  "#{contact[0]}: #{contact[1]} (#{contact[2]})"
      unless contact[3] == nil
        contact[3].each do |k,v|
          contact_info << " #{v}: #{k} "
        end
      end
    contact_info
  end
 
  ## Class Methods
  class << self

    def connect
      ContactDatabase.new
    end

    def create(name, email, phone_numbers)
      contact = Contact.new(name, email, phone_numbers)
      connection = connect
      index = connection.read_all.last[0] unless connection.read_all.empty?
      connection.write(contact, index.to_i + 1)
    end
 
    def find(term)
      connect.read_all.select { |contact| contact.join(" ").include?(term) }
    end
 
    def all
      connect.read_all
    end
    
    def show(id)
      connect.read_all.find { |contact| contact[0].eql?(id) }
    end
  end
end