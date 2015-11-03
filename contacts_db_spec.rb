require_relative 'contact_database'

describe ContactDatabase do
  it 'should return empty string' do
    expect(ContactDatabase.new.read[0]).to eql(["1", "Don Burks", "don@lhl.ca"])
  end
  # it 'should add a new contact' do
  #   contact = ["Theo Ng", "theo@lhl.ca"]
  #   cd = ContactDatabase.new
  #   cd.write(contact)
  #   expect(cd.read[-1]).to eql(contact)
  # end
end