require_relative '../contact_list'

describe ContactList do

  describe '#help' do
    it 'should display a menu with options' do
      expect(ContactList.help).to eql("Here is a list of available commands:
        new  - Create a new contact
        list - List all contacts
        show - Show a contact
        find - Find a contact")
    end
  end
  describe '#new' do
    # it 'should create a new contact' do
    #   expect(ContactList.new_contact).to eql(["Theo Ng", "theo@lhl.ca"])
    # end
  end
  describe '#show' do
    it 'should list all contacts' do
      expect(ContactList.show('1')).to eql("1: Don Burks (don@lhl.ca)")
    end
  end
  describe '' do
    it 'should show a contact' do
    end
  end
  describe '' do
    it 'should find a contact' do
    end
  end
end