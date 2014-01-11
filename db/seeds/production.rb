user1 = User.create(
  password: "test12345",
  firstname: "Administrator",
  lastname: "club.organizr",
  email: "admin@club.organizr.org",
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