# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

BalanceSheet.destroy_all
puts 'Balance Sheet destroyed'
PropertyContract.destroy_all
puts 'Contracts destroyed'
Property.destroy_all
puts 'Propery destroyed'
Message.destroy_all
puts 'Messages destroyed'
User.destroy_all
puts 'User destroyed'
Expense.destroy_all
puts 'Expense destroyed'

user1 = User.new(first_name: 'Pierre', last_name: 'Dupond', gender: 'Male', profession: 'Sales', professional_status: 'Full Time', birth_date: '30/07/1991', user_type: 'Propriétaire', email: 'papa@gmail.com', password: 'papa@gmail.com' )
user1.save!
puts 'User 1 saved'

user2 = User.new(first_name: 'Manon', last_name: 'Coulot', gender: 'Female', profession: 'Product', professional_status: 'Part Time', birth_date: '23/11/1993', user_type: 'Locataire', email: 'maman@gmail.com', password: 'maman@gmail.com' )
user2.save!
puts 'User 2 saved'

user3 = User.new(first_name: '', last_name: '', gender: '', profession: '', professional_status: '', birth_date: '', user_type: '', email: 'soeur@gmail.com', password: 'soeur@gmail.com' )
user3.save!
puts 'User 3 saved'

property = Property.new(rental_status: 'Rented', size: '89', address: '4 Chemin du Bois, Caluire-et-Cuire', property_name: 'Flat in the heart of Roubaix', property_type: 'Maison', property_amount: '370000', user_id: 1)
property.save!
puts "Property 1 saved"

property = Property.new(rental_status: 'To Rent', size: '120', address: '6 Rue Montcalm, 75018, Paris', property_name: 'Flat near Bordeaux', property_type: 'Appartement', property_amount: '240000', user_id: 1)
property.save!
puts "Property 2 saved"

property = Property.new(rental_status: 'Rented', size: '100', address: '328 rue des pyrénées, 75020, Paris', property_name: 'Flat in Paris', property_type: 'Appartement', property_amount: '300000', user_id: 1)
property.save!
puts "Property 3 saved"

contract = PropertyContract.new(end_date: '12/12/2025', start_date: '12/12/2022', scheduled_payment_date: '12/12/2022', billing_frequency: 'monthly', rent_price: '2300', rent_payment_status: 'false', user_id: 2, property_id: 1)
contract.save!
puts "PropertyContract 1 saved"

contract = PropertyContract.new(end_date: '19/05/2023', start_date: '19/05/2020', scheduled_payment_date: '19/05/2020', billing_frequency: 'weekly', rent_price: '1590', rent_payment_status: 'true', user_id: 3, property_id: 2)
contract.save!
puts "PropertyContract 2 saved"


contract = PropertyContract.new(end_date: '19/05/2023', start_date: '19/05/2020', scheduled_payment_date: '19/05/2020', billing_frequency: 'weekly', rent_price: '1600', rent_payment_status: 'true', user_id: 1, property_id: 3)
contract.save!
puts "PropertyContract 3 saved"
message = Message.new(content: 'Molo mon coco quand même !', user_id: 1, property_contract_id: 1)
message.save!
puts "Message 3 saved"
message = Message.new(content: 'Hello. Je viens de vous accepter pour habiter chez nous.', user_id: 1, property_contract_id: 1)
message.save!
puts "Message 1 saved"

message = Message.new(content: 'Merci beaucoup. Très content de pouvoir faire la fête chez vous !', user_id: 2, property_contract_id: 1)
message.save!
puts "Message 2 saved"

message = Message.new(content: 'Molo mon coco quand même !', user_id: 1, property_contract_id: 1)
message.save!
puts "Message 3 saved"

message = Message.new(content: 'Salut Pierre. Je paierai mon loyer lorsque tu auras remboursé le plombier. Merci beaucoup !', user_id: 2, property_contract_id: 1)
message.save!
puts "Message 4 saved"

balance = BalanceSheet.new(property_contract_id: 1)
balance.save!

puts "BalanceSheet 1 saved"

balance = BalanceSheet.new(property_contract_id: 2)
balance.save!
puts "BalanceSheet 2 saved"

balance = BalanceSheet.new(property_contract_id: 3)
balance.save!
puts "BalanceSheet 3 saved"

#-----------------PROPERTY 1------------------------

income = Income.new(amount: '2300', type: 'Loyer', paid: 'true', payment_date: '2021-09-03', balance_sheet_id: 1)
income.save!
puts "Income 6 Property 1 saved "

income = Income.new(amount: '2300', type: 'Loyer', paid: 'true', payment_date: '2021-10-03', balance_sheet_id: 1)
income.save!
puts "Income 1 Property 1 saved "

income = Income.new(amount: '2300', type: 'Loyer', paid: 'true', payment_date: '2021-11-04', balance_sheet_id: 1)
income.save!
puts "Income 2 Property 1 saved"

income = Income.new(amount: '2300', type: 'Loyer', paid: 'true', payment_date: '2021-12-04', balance_sheet_id: 1)
income.save!
puts "Income 3 Property 1 saved"

income = Income.new(amount: '2300', type: 'Loyer', paid: 'true', payment_date: '2022-01-04', balance_sheet_id: 1)
income.save!
puts "Income 4 Property 1 saved"

income = Income.new(amount: '120', type: 'Loyer', paid: 'true', payment_date: '2022-02-04', balance_sheet_id: 1)
income.save!
puts "Income 5 Property 1 saved"

expense = Expense.new(balance_sheet_id: 1, amount: '18', type: 'Admin', paid: true, state: 'paid', payment_date: '2021-09-08')
expense.save!
puts "Expense 7 Property 1 saved"

expense = Expense.new(balance_sheet_id: 1, amount: '44', type: 'plumber', paid: false, state: 'pending', payment_date: '2022-02-22')
expense.save!
puts "Expense Plumber Pending Property 1 saved"

expense = Expense.new(balance_sheet_id: 1, amount: '300', type: 'building operation', paid: true, state: 'paid', payment_date: '2021-10-05')
expense.save!
puts "Expense 2 Property 1 saved"

expense = Expense.new(balance_sheet_id: 1, amount: '400', type: 'co-property charge', paid: true, state: 'paid', payment_date: '2021-12-03')
expense.save!
puts "Expense 3 Property 1 saved"

expense = Expense.new(balance_sheet_id: 1, amount: '200', type: 'building operation', paid: true, state: 'paid', payment_date: '2021-11-15')
expense.save!
puts "Expense 4 Property 1 saved"

expense = Expense.new(balance_sheet_id: 1, amount: '1200', type: 'building operation', paid: true, state: 'paid', payment_date: '2022-01-15')
expense.save!
puts "Expense 5 Property 1 saved"

expense = Expense.new(balance_sheet_id: 1, amount: '116', type: 'co-property charge', paid: true, state: 'paid', payment_date: '2022-02-08')
expense.save!
puts "Expense 6 Property 1 saved"


#-----------------PROPERTY 2------------------------

income = Income.new(amount: '1300', type: 'Loyer', paid: 'true', payment_date: '2021-10-03', balance_sheet_id: 2)
income.save!
puts "Income 1 Property 2 saved "

income = Income.new(amount: '1300', type: 'Loyer', paid: 'true', payment_date: '2021-11-04', balance_sheet_id: 2)
income.save!
puts "Income 2 Property 2 saved"

income = Income.new(amount: '1300', type: 'Loyer', paid: 'true', payment_date: '2021-12-04', balance_sheet_id: 2)
income.save!
puts "Income 3 Property 2 saved"

income = Income.new(amount: '1300', type: 'Loyer', paid: 'true', payment_date: '2022-01-04', balance_sheet_id: 2)
income.save!
puts "Income 4 Property 2 saved"

income = Income.new(amount: '1300', type: 'Loyer', paid: 'true', payment_date: '2022-02-04', balance_sheet_id: 2)
income.save!
puts "Income 5 Property 2 saved"

income = Income.new(amount: '1300', type: 'Loyer', paid: 'true', payment_date: '2021-09-04', balance_sheet_id: 2)
income.save!
puts "Income 6 Property 2 saved"

expense = Expense.new(balance_sheet_id: 2, amount: '150', type: 'Admin', paid: false, state: 'paid', payment_date: '2021-11-05')
expense.save!
puts "Expense 1 Property 2 saved"

expense = Expense.new(balance_sheet_id: 2, amount: '800', type: 'building operation', paid: true, state: 'paid', payment_date: '2021-10-05')
expense.save!
puts "Expense 2 Property 2 saved"

expense = Expense.new(balance_sheet_id: 2, amount: '220', type: 'co-property charge', paid: true, state: 'paid', payment_date: '2021-12-03')
expense.save!
puts "Expense 3 Property 2 saved"

expense = Expense.new(balance_sheet_id: 2, amount: '743', type: 'admin', paid: true, state: 'paid', payment_date: '2022-01-22')
expense.save!
puts "Expense 4 Property 2 saved"

expense = Expense.new(balance_sheet_id: 2, amount: '834', type: 'co-property charge', paid: true, state: 'paid', payment_date: '2022-02-12')
expense.save!
puts "Expense 5 Property 2 saved"

expense = Expense.new(balance_sheet_id: 2, amount: '150', type: 'co-property charge', paid: true, state: 'paid', payment_date: '2022-02-12')
expense.save!
puts "Expense 6 Property 2 saved"

expense = Expense.new(balance_sheet_id: 2, amount: '1000', type: 'Admin', paid: true, state: 'paid', payment_date: '2021-09-12')
expense.save!
puts "Expense 7 Property 2 saved"

#-----------------PROPERTY 3------------------------

income = Income.new(amount: '1600', type: 'Loyer', paid: 'true', payment_date: '2021-10-05', balance_sheet_id: 3)
income.save!
puts "Income 1 Property 3 saved "

income = Income.new(amount: '1600', type: 'Loyer', paid: 'true', payment_date: '2021-11-02', balance_sheet_id: 3)
income.save!
puts "Income 2 Property 3 saved"

income = Income.new(amount: '1600', type: 'Loyer', paid: 'true', payment_date: '2021-12-03', balance_sheet_id: 3)
income.save!
puts "Income 3 Property 3 saved"

income = Income.new(amount: '1600', type: 'Loyer', paid: 'true', payment_date: '2022-01-03', balance_sheet_id: 3)
income.save!
puts "Income 4 Property 3 saved"

income = Income.new(amount: '1600', type: 'Loyer', paid: 'true', payment_date: '2022-02-03', balance_sheet_id: 3)
income.save!
puts "Income 5 Property 3 saved"

income = Income.new(amount: '1600', type: 'Loyer', paid: 'true', payment_date: '2021-09-03', balance_sheet_id: 3)
income.save!
puts "Income 6 Property 3 saved"

expense = Expense.new(balance_sheet_id: 3, amount: '400', type: 'Admin', paid: false, state: 'paid', payment_date: '2021-11-12')
expense.save!
puts "Expense 1 Property 3 saved"

expense = Expense.new(balance_sheet_id: 3, amount: '34', type: 'building operation', paid: true, state: 'paid', payment_date: '2021-10-04')
expense.save!
puts "Expense 2 Property 3 saved"

expense = Expense.new(balance_sheet_id: 3, amount: '483', type: 'co-property charge', paid: true, state: 'paid', payment_date: '2021-12-13')
expense.save!
puts "Expense 3 Property 3 saved"

expense = Expense.new(balance_sheet_id: 3, amount: '60', type: 'Admin', paid: false, state: 'paid', payment_date: '2021-09-12')
expense.save!
puts "Expense 4 Property 3 saved"

expense = Expense.new(balance_sheet_id: 3, amount: '489', type: 'building operation', paid: true, state: 'paid', payment_date: '2022-01-04')
expense.save!
puts "Expense 5 Property 3 saved"

expense = Expense.new(balance_sheet_id: 3, amount: '483', type: 'co-property charge', paid: true, state: 'paid', payment_date: '2022-02-13')
expense.save!
puts "Expense 6 Property 3 saved"
