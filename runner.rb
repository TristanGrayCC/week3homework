require_relative('models/customer')
require_relative('models/film')
require_relative('models/ticket')

require('pry')

Ticket.delete_all()
Film.delete_all()
Customer.delete_all()

customer1 = Customer.new({'name'=>'Tristan Gray','funds'=>'20'})
customer1.save()
customer2 = Customer.new({'name'=>'Johnny English','funds'=>'30'})
customer2.save()

film1 = Film.new({'title'=>'Clash of the Titans','price'=>'5'})
film1.save()
film2 = Film.new({'title'=>'Solaris','price'=>'6'})
film2.save()

ticket1 = Ticket.new({'customer_id'=>customer1.id,'film_id'=>film1.id})
ticket1.buy(customer1)
ticket2 = Ticket.new({'customer_id'=>customer2.id,'film_id'=>film1.id})
ticket2.buy(customer2)
ticket3 = Ticket.new({'customer_id'=>customer1.id,'film_id'=>film2.id})
ticket3.buy(customer1)

binding.pry
nil
