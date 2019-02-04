require_relative("../db/sql_runner.rb")

class Customer

  attr_accessor :name, :funds
  attr_reader :id

  def initialize( options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @funds = options['funds']
  end

  def films()
    sql = "SELECT *
      FROM films
      INNER JOIN tickets
      ON films.id = tickets.film_id
      INNER JOIN customers
      ON customers.id = tickets.customer_id
      WHERE customers.id = $1"
    values = [@id]
    result = SqlRunner.run(sql,values)
    return result.map{|film| Film.new(film)}
  end

  def save()
    sql = "INSERT INTO customers(name,funds) VALUES ($1,$2) RETURNING id"
    values = [@name,@funds]
    cust = SqlRunner.run(sql,values).first
    @id = cust['id'].to_i
  end

  def update()
    sql = "UPDATE customers SET (name,funds) = ($1,$2) WHERE id = $3"
    values = [@name,@funds,@id]
    SqlRunner.run(sql,values)
  end

  def delete()
    sql = "DELETE FROM customers WHERE id = $1"
    values =[@id]
    SqlRunner.run(sql,values)
  end

  def self.find(id)
    sql = "SELECT * FROM customers WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql,values).first
    return Star.new(result)
  end

  def self.find_all()
    sql = "SELECT * FROM customers"
    result = SqlRunner.run(sql)
    return result.map{|star| Star.new(star)}
  end

  def self.delete_all()
    sql = "DELETE FROM customers"
    SqlRunner.run(sql)
  end

end
