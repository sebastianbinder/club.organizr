User.delete_all
Event.delete_all
EventsUser.delete_all
Customer.delete_all
CustomersUser.delete_all

customer1 = Customer.create(
  name: "MyClub",
  street: "Brooklyn Street",
  street_number: "1460",
  zipcode: "10024",
  city: "Manhattan",
  country: "NY, USA"
)

customer2 = Customer.create(
  name: "MySecondClub",
  street: "Brooklyn Street",
  street_number: "1460",
  zipcode: "10024",
  city: "Manhattan",
  country: "NY, USA"
)

user1 = User.create(
  password: "test12345",
  firstname: "Taylor",
  lastname: "Class",
  email: "tclass@club.organizr.org",
  phone_number: "+1-647-3746",
  street: "Brooklyn Street",
  street_number: "1460",
  zipcode: "10024",
  city: "Manhattan",
  country: "NY, USA"
)

user2 = User.create(
  password: "test12345",
  firstname: "Wynona",
  lastname: "Browning",
  email: "wbrowning@club.organizr.org",
  phone_number: "+1-647-3746",
  street: "Brooklyn Street",
  street_number: "1460",
  zipcode: "10024",
  city: "Manhattan",
  country: "NY, USA"
)

user3 = User.create(
  password: "test12345",
  firstname: "Thomas",
  lastname: "Sloan",
  email: "tsloan@club.organizr.org",
  phone_number: "+1-647-3746",
  street: "Brooklyn Street",
  street_number: "1460",
  zipcode: "10024",
  city: "Manhattan",
  country: "NY, USA"
)


CustomersUser.create(
  user_id: user1.id,
  customer_id: 0,
  role: "admin"
)

CustomersUser.create(
  user_id: user2.id,
  customer_id: customer1.id,
  role: "customer"
)

CustomersUser.create(
  user_id: user3.id,
  customer_id: customer1.id,
  role: "member"
)

CustomersUser.create(
  user_id: user2.id,
  customer_id: customer2.id,
  role: "organizer"
)

CustomersUser.create(
  user_id: user3.id,
  customer_id: customer2.id,
  role: "viewer"
)

20.times do
  Event.create(
    from: rand(1...90).days.from_now,
    title: "Event",
    location: "Everywhere",
    details: "",
    customer_id: customer1.id,
	should_respond: true,
	status: "taking_place"
  )
end