require_relative("../db/sql_runner")

class ticket

  attr_reader :id
  attr_accessor :customer_id, :film_id, :review

  def initialize(options)
    @id = options['id'].to_i
    @customer_id = options['customer_id'].to_i
    @film_id = options['film_id'].to_i
    @review = options['review']
  end

  def film()
    sql = "SELECT * FROM films where id = #{@film_id}"
    film = SqlRunner.run(sql).first
    return film.new(film)
  end

  def customer()
    sql = "SELECT * FROM customers where id = #{@customer_id}"
    customer = SqlRunner.run(sql).first
    return customer.new(customer)
  end

  def save()
    sql = "INSERT INTO tickets (customer_id, film_id, review)
           VALUES ('#{@customer_id}', '#{@film_id}', '#{@review}') RETURNING id"
    ticket = SqlRunner.run(sql).first
    @id = ticket['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM tickets"
    tickets = SqlRunner.run(sql)
    result = tickets.map {|ticket|ticket.new(ticket)}
    return result
  end

  def self.delete_all()
    sql = "DELETE FROM tickets"
    SqlRunner.run(sql)
  end

end
