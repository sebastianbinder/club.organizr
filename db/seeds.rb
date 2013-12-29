# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.delete_all
Event.delete_all

case Rails.env
when "development"

User.create(
  password: "test12345",
  firstname: "Taylor",
  lastname: "Class",
  email: "tclass@sebastianbinder.com",
  phone_number: "+1-647-3746",
  street: "Brooklyn Street",
  street_number: "1460",
  zipcode: "10024",
  city: "Manhattan",
  country: "NY, USA",
  roles_mask: 1
)

User.create(
  password: "test12345",
  firstname: "Wynona",
  lastname: "Browning",
  email: "wbrowning@sebastianbinder.com",
  phone_number: "+1-647-3746",
  street: "Brooklyn Street",
  street_number: "1460",
  zipcode: "10024",
  city: "Manhattan",
  country: "NY, USA",
  roles_mask: 4
)

User.create(
  password: "test12345",
  firstname: "Thomas",
  lastname: "Sloan",
  email: "tsloan@sebastianbinder.com",
  phone_number: "+1-647-3746",
  street: "Brooklyn Street",
  street_number: "1460",
  zipcode: "10024",
  city: "Manhattan",
  country: "NY, USA",
  roles_mask: 8
)

20.times do
  Event.create(
    date: rand(1...90).days.from_now,
    time: "19:00:00",
    title: "Event",
    location: "Everywhere",
    details: ""
  )
end

when "production"

User.create(
  password: "admin",
  firstname: "Adminis",
  lastname: "trator",
  email: "admin@organizeme",
  phone_number: "",
  street: "",
  street_number: "",
  zipcode: "",
  city: "",
  country: "",
  roles_mask: 1
)

end