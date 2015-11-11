class Phones

  attr_accessor :numbers, :label
  attr_reader :id, :contact_id

  def initialize(numbers, label, contact_id, id = nil)
    @numbers = numbers
    @label = label
    @contact_id = contact_id
  end

  def self.connection
    @@conn ||= PG::Connection.open(dbname: 'contacts')
  end

  def save
    id ? update : insert
  end

  def insert
    result = self.class.connection.exec_params('INSERT INTO phones (numbers, label, contact_id) VALUES ($1, $2, $3) RETURNING id;', [numbers, label, contact_id])
    @id = result[0]["id"]
  end

  def update
    self.class.connection.exec_params('UPDATE phones SET numbers = $1, label = $2, contact_id = $3 WHERE id = $4;', [numbers, label, contact_id, id])
  end

  def destroy
    self.class.connection.exec_params('DELETE FROM phones WHERE id = $1;', [id])
  end

  def self.find(id)
    find_by('id', id, true)
  end

  def self.find_all_by_label(label)
    find_by('label', label, false)
  end

  def self.find_by_numbers(numbers)
    find_by('numbers', numbers, true)
  end

  def self.find_all_by_contact_id(contact_id)
    find_by('contact_id', contact_id, false)
  end

  def self.find_by(column, value, unique)
    result = connection.exec_params("SELECT * FROM phones WHERE #{column} = $1;", [value])
    return result.to_a unless unique
    Phones.new(result[0]['numbers'], result[0]['label'], result[0]['contact_id'], result[0]['id']) if result.ntuples > 0
  end

  private :insert, :update

end