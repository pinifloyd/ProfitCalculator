# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

borrower = Borrower.create name: 'ЮЛ1', summ: 1_000_000

%i(set_intime set_intime set_intime set_intime set_intime set_intime).each do |event|
  borrower.periods.build.send(event)
end

borrower = Borrower.create name: 'ЮЛ2', summ: 1_000_000

%i(set_intime set_intime set_intime set_ahead).each do |event|
  borrower.periods.build.send(event)
end

borrower = Borrower.create name: 'ЮЛ3', summ: 1_000_000

%i(set_intime set_intime set_overdue set_overdue set_overdue set_overdue).each do |event|
  borrower.periods.build.send(event)
end
