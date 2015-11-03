require_relative 'contact_list'

describe ContactList do
  it 'should display a menu with options' do
    expect(ContactList.help).to eql("Here is a list of available commands:
      new  - Create a new contact
      list - List all contacts
      show - Show a contact
      find - Find a contact")
  end
  it 'should create a new contact' do
    expect(ContactList.new_contact).to eql(["Theo Ng", "theo@lhl.ca"])
  end
  it 'should list all contacts' do
  end
  it 'should show a contact' do
  end
  it 'should find a contact' do
  end
end