require_relative '../contact.rb'
require_relative '../contact_database.rb'

describe Contact do 
  describe '#create' do
    it 'should create a new contact with phone number' do
      expect(Contact.create('theo', 'theo@gmail.com', {'604-312-2661' => 'mobile', '604-271-8663' => 'home'})).to be nil
    end
  end
end