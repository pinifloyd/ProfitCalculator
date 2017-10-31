# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

%w(ЮЛ1 ЮЛ2 ЮЛ3).each do |name|
  Borrower.create name: name, summ: 1_000_000, norm_rate: 30, over_rate: 50, term: 6
end
