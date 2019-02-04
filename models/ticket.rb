require_relative("../db/sql_runner.rb")

class Ticket

  attr_reader :id
  attr_accessor :film_id, :customer_id

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @customer_id = options['customer_id']
    @film_id = options['film_id']
  end

  def save()
    sql = "INSERT INTO tickets(film_id,customer_id)VALUES($1,$2) RETURNING id"
    values = [@film_id,@customer_id]
    result = SqlRunner.run(sql,values).first
    @id = result['id'].to_i
  end

  def delete()
    sql = "DELETE FROM tickets WHERE id = $1"
    values =[@id]
    SqlRunner.run(sql,values)
  end

  def self.find(id)
    sql = "SELECT * FROM tickets WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql,values).first
    return Ticket.new(result)
  end

  def self.find_all()
    sql = "SELECT * FROM tickets"
    result = SqlRunner.run(sql)
    return result.map{|ticket| Ticket.new(ticket)}
  end

  def self.delete_all()
    sql = "DELETE FROM tickets"
    SqlRunner.run(sql)
  end

end
