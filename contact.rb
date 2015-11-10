class Contact

  attr_accessor :firstname, :lastname, :email
  attr_reader :id

  def initialize(firstname, lastname, email, id = nil)
    @firstname = firstname
    @lastname = lastname
    @email = email
  end

  def self.connection
    @@conn ||= PG::Connection.open(dbname: 'contacts')
  end

  def save
    id ? update : insert
  end

  def insert
    result = self.class.connection.exec_params('INSERT INTO contacts (firstname, lastname, email) VALUES ($1, $2, $3) RETURNING id;', [firstname, lastname, email])
    @id = result[0]["id"]
  end

  def update
    self.class.connection.exec_params('UPDATE contacts SET firstname = $1, lastname = $2, email = $3 WHERE id = $4;', [firstname, lastname, email, id])
  end

  def destroy
    self.class.connection.exec_params('DELETE FROM contacts WHERE id = $1;', [id])
  end

  def self.find(id)
    result = connection.exec_params('SELECT * FROM contacts WHERE id = $1;', [id])
    return nil if result.ntuples == 0
    Contact.new(result[0]['firstname'], result[0]['lastname'], result[0]['email'], id)
  end

  def self.find_all_by_lastname(name)
    result = connection.exec_params('SELECT * FROM contacts WHERE lastname = $1;', [name])
    result.to_a
  end

  def self.find_all_by_firstname(name)
    result = connection.exec_params('SELECT * FROM contacts WHERE firstname = $1;', [name])
    result.to_a
  end

  def self.find_by_email(email)
    result = connection.exec_params('SELECT * FROM contacts WHERE email = $1;', [email])
    return nil if result.ntuples == 0
    Contact.new(result[0]['firstname'], result[0]['lastname'], result[0]['email'], result[0]['id'])
  end

  private :insert, :update

end