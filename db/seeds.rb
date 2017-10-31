# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# %w(ЮЛ1 ЮЛ2 ЮЛ3).each do |name|
#   Borrower.create name: name, summ: 1_000_000, norm_rate: 30, over_rate: 50, term: 6
# end

borrower = Borrower.create name: 'ЮЛ1', summ: 1_000_000

[ { summ: 191_666.67, payed_at: '10.01.2017' },
  { summ: 191_666.67, payed_at: '10.02.2017' },
  { summ: 191_666.67, payed_at: '10.03.2017' },
  { summ: 191_666.67, payed_at: '10.04.2017' },
  { summ: 191_666.67, payed_at: '10.05.2017' },
  { summ: 191_666.67, payed_at: '10.06.2017' }
].each { |payment| borrower.payments.create(payment) }

borrower = Borrower.create name: 'ЮЛ2', summ: 1_000_000

[ { summ: 191_666.67, payed_at: '10.01.2017' },
  { summ: 191_666.67, payed_at: '10.02.2017' },
  { summ: 191_666.67, payed_at: '10.03.2017' },
  { summ: 525_000.00, payed_at: '10.04.2017' },
  { summ: 0,          payed_at: '10.05.2017' },
  { summ: 0,          payed_at: '10.06.2017' }
].each { |payment| borrower.payments.create(payment) }

borrower = Borrower.create name: 'ЮЛ3', summ: 1_000_000

[ { summ: 191_666.67, payed_at: '10.01.2017' },
  { summ: 191_666.67, payed_at: '10.02.2017' },
  { summ: 208_333.33, payed_at: '10.03.2017' },
  { summ: 208_333.33, payed_at: '10.04.2017' },
  { summ: 208_333.33, payed_at: '10.05.2017' },
  { summ: 208_333.33, payed_at: '10.06.2017' }
].each { |payment| borrower.payments.create(payment) }
