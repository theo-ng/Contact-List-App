require_relative 'contact_database'

# describe ContactDatabase do
#   it 'should return empty string' do
#     expect(ContactDatabase.new.read).to eql([])
#   end
#   it 'should add a new contact' do
#     contact = "Test2, test2@lhl.ca"
#     cd = ContactDatabase.new
#     cd.write(contact)
#     expect(cd.read).to eql([[contact]])
#   end
# end