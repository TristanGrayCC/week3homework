require_relative('models/customer')
require_relative('models/film')
require_relative('models/ticket')

require('pry')

ticket.delete_all()
film.delete_all()
customer.delete_all()

customer1 = customer.new({'name'=>'Samwise Gamgee','funds'=>'20'})
customer1.save()
customer2 = customer.new({'name'=>'Gollum','funds'=>'30'})
customer2.save()

film1 = film.new({'title'=>'Attractions','price'=>'5'})
film1.save()
film2 = film.new({'title'=>'Places To Go','price'=>'6'})
film2.save()

ticket1 = ticket.new({'customer_id'=>customer1.id,'film_id'=>film1.id})
ticket1.save()
ticket2 = ticket.new({'customer_id'=>customer2.id,'film_id'=>film1.id})
ticket2.save()
ticket3 = ticket.new({'customer_id'=>customer1.id,'film_id'=>film2.id})
ticket3.save()

binding.pry
nil
