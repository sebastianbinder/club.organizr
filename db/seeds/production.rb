customer1 = Customer.create(
  name: "MyClub",
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