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
  email: "tclass@sebastianbinder.com",
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
  email: "wbrowning@sebastianbinder.com",
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
  email: "tsloan@sebastianbinder.com",
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
  role: "viewer"
)

CustomersUser.create(
  user_id: user2.id,
  customer_id: customer2.id,
  role: "member"
)

20.times do
  Event.create(
    date: rand(1...90).days.from_now,
    time: "19:00:00",
    title: "Event",
    location: "Everywhere",
    details: "",
    customer_id: customer1.id

  )
end