require_relative('./models/customer.rb')
require_relative('./models/film.rb')
require_relative('./models/ticket.rb')
require('pry')

Ticket.delete_all()
Film.delete_all()
Customer.delete_all()


customer_1 = {
  "name" => "Matt",
  "funds" => 50
}
customer_2 = {
  "name" => "Neil",
  "funds" => 65
}
customer_3 = {
  "name" => "Linda",
  "funds" => 85
}
customer_4 = {
  "name" => "Jane",
  "funds" => 55
}
customer_5 = {
  "name" => "Karen",
  "funds" => 45
}


film_1 = {
  'title' => 'Aliens',
  'price' => 5
}

film_2 = {
  'title' => 'Serenity',
  'price' => 7
}

film_3 = {
  'title' => 'Oblivion',
  'price' => 5
}

film_4 = {
  'title' => 'Lucy',
  'price' => 7
}

film_5 = {
  'title' => 'Interstellar',
  'price' => 5
}

film_6 = {
  'title' => 'Arrival',
  'price' => 7
}


customer_1 = Customer.new(customer_1)
customer_2 = Customer.new(customer_2)
customer_3 = Customer.new(customer_3)
customer_4 = Customer.new(customer_4)
customer_5 = Customer.new(customer_5)

film_1 = Film.new(film_1)
film_2 = Film.new(film_2)
film_3 = Film.new(film_3)
film_4 = Film.new(film_4)
film_5 = Film.new(film_5)
film_6 = Film.new(film_6)

customer_1.save()
customer_2.save()
customer_3.save()
customer_4.save()
customer_5.save()

film_1.save()
film_2.save()
film_3.save()
film_4.save()
film_5.save()
film_6.save()



ticket_01 = {
  "customer_id" => customer_1.id,
  "film_id" => film_1.id
}

ticket_02 = {
  "customer_id" => customer_2.id,
  "film_id" => film_3.id
}

ticket_03 = {
  "customer_id" => customer_3.id,
  "film_id" => film_5.id
}

ticket_04 = {
  "customer_id" => customer_4.id,
  "film_id" => film_2.id
}

ticket_05 = {
  "customer_id" => customer_5.id,
  "film_id" => film_4.id
}

ticket_06 = {
  "customer_id" => customer_1.id,
  "film_id" => film_6.id
}

ticket_07 = {
  "customer_id" => customer_2.id,
  "film_id" => film_1.id
}

ticket_08 = {
  "customer_id" => customer_3.id,
  "film_id" => film_3.id
}

ticket_09 = {
  "customer_id" => customer_4.id,
  "film_id" => film_5.id
}

ticket_10 = {
  "customer_id" => customer_5.id,
  "film_id" => film_2.id
}

ticket_01 = Ticket.new(ticket_01)
ticket_02 = Ticket.new(ticket_02)
ticket_03 = Ticket.new(ticket_03)
ticket_04 = Ticket.new(ticket_04)
ticket_05 = Ticket.new(ticket_05)
ticket_06 = Ticket.new(ticket_06)
ticket_07 = Ticket.new(ticket_07)
ticket_08 = Ticket.new(ticket_08)
ticket_09 = Ticket.new(ticket_09)
ticket_10 = Ticket.new(ticket_10)

ticket_01.save()
ticket_02.save()
ticket_03.save()
ticket_04.save()
ticket_05.save()
ticket_06.save()
ticket_07.save()
ticket_08.save()
ticket_09.save()
ticket_10.save()

binding.pry
nil
