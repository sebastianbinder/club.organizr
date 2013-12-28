# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.delete_all
Event.delete_all

User.create(
  password: "test12345",
  firstname: "Sebastian",
  lastname: "Binder",
  email: "admin@sebastianbinder.com",
  phone_number: "+49 89 421992",
  street: "Zehntfeldstraße",
  street_number: "163",
  zipcode: "81825",
  city: "München",
  country: "Deutschland",
  roles_mask: 1
)

User.create(
  password: "test12345",
  firstname: "Sebastian",
  lastname: "Binder",
  email: "organizer@sebastianbinder.com",
  phone_number: "+49 89 421992",
  street: "Zehntfeldstraße",
  street_number: "163",
  zipcode: "81825",
  city: "München",
  country: "Deutschland",
  roles_mask: 4
)

User.create(
  password: "test12345",
  firstname: "Sebastian",
  lastname: "Binder",
  email: "member@sebastianbinder.com",
  phone_number: "+49 89 421992",
  street: "Zehntfeldstraße",
  street_number: "163",
  zipcode: "81825",
  city: "München",
  country: "Deutschland",
  roles_mask: 8
)

20.times do
  Event.create(
    date: rand(1...90).days.from_now,
    time: "19:00:00",
    title: "Probe",
    location: "St. Augustinus",
    details: ""
  )
end