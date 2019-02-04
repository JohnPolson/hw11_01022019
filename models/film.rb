require_relative("../db/sql_runner.rb")

class Film

  attr_accessor :title, :price
  attr_reader :id

  def initialize( options )

    @id = options['id'].to_i if options['id']
    @title = options['title']
    @price = options['price']
  end

  def customers()
    sql = "SELECT *
      FROM customers
      INNER JOIN tickets
      ON customers.id = tickets.customer_id
      INNER JOIN films
      ON films.id = tickets.film_id
      WHERE films.id = $1"
    values = [@id]
    result = SqlRunner.run(sql,values)
    return result.map{|customer| Customer.new(customer)}
  end

  def save()
    sql = "INSERT INTO films(title,price) VALUES ($1,$2) RETURNING id"
    values = [@title,@price]
    film = SqlRunner.run(sql,values).first
    @id = film['id'].to_i
  end

  def update()
    sql = "UPDATE films SET (title,price) = ($1,$2) WHERE id = $3"
    values = [@title,@price,@id]
    SqlRunner.run(sql,values)
  end



  def delete()
    sql = "DELETE FROM films WHERE id = $1"
    values =[@id]
    SqlRunner.run(sql,values)
  end

  def self.find(id)
    sql = "SELECT * FROM films WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql,values).first
    return Film.new(result)
  end

  def self.find_all()
    sql = "SELECT * FROM films"
    result = SqlRunner.run(sql)
    return result.map{|film| Film.new(film)}
  end

  def self.delete_all()
    sql = "DELETE FROM films"
    SqlRunner.run(sql)
  end

end
