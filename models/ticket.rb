require_relative("../db/sql_runner")

require('pry')

class Ticket

  attr_reader :id
  attr_accessor :customer_id, :film_id

  def initialize(options)
    @id = options['id'].to_i
    @customer_id = options['customer_id'].to_i
    @film_id = options['film_id'].to_i
  end

  def film()
    sql = "SELECT * FROM films where id = #{@film_id}"
    film = SqlRunner.run(sql).first
    return Film.new(film)
  end

  def customer()
    sql = "SELECT * FROM customers where id = #{@customer_id}"
    customer = SqlRunner.run(sql).first
    return Customer.new(customer)
  end

  def buy(customer)
    sql = "INSERT INTO tickets (customer_id, film_id)
           VALUES (#{@customer_id}, #{@film_id}) RETURNING id"
    ticket = SqlRunner.run(sql).first
    @id = ticket['id'].to_i
    film = Film.find_by_id(@film_id)
    price = film.first.price.to_i
    customer_funds = Customer.find_by_id(@customer_id).first.funds
    customer_funds -= price
    binding.pry
    customer.funds = customer_funds
    customer.update()
  end

  def delete
    sql = "DELETE FROM tickets WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def update
    sql = "UPDATE tickets SET (customer_id, film_id) = (#{@customer_id}, #{@film_id}) WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM tickets"
    tickets = SqlRunner.run(sql)
    result = tickets.map {|ticket|Ticket.new(ticket)}
    return result
  end

  def self.delete_all()
    sql = "DELETE FROM tickets"
    SqlRunner.run(sql)
  end

end
