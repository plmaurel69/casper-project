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

user = User.new(first_name: 'Pierre', last_name: 'Dupond', gender: 'Homme', profession: 'Sales', professional_status: 'CDI', birth_date: '30/07/1991', user_type: 'Propriétaire', email: 'papa@gmail.com', password: 'papa@gmail.com' )
user.save!
puts 'User 1 saved'

user = User.new(first_name: 'Manon', last_name: 'Coulot', gender: 'Femme', profession: 'Product', professional_status: 'CDD', birth_date: '23/11/1993', user_type: 'Locataire', email: 'maman@gmail.com', password: 'maman@gmail.com' )
user.save!
puts 'User 2 saved'

user = User.new(first_name: 'Emma', last_name: 'Schmidt', gender: 'Femme', profession: 'Analyste', professional_status: 'Freelance', birth_date: '14/09/1984', user_type: 'Locataire', email: 'soeur@gmail.com', password: 'soeur@gmail.com' )
user.save!
puts 'User 3 saved'

property = Property.new(rental_status: 'Loué', size: '89', address: '4 Chemin du Bois, Caluire-et-Cuire', property_name: 'Maison en centre-ville de Caluire', property_type: 'Maison', property_amount: '370000', user_id: 1)
property.save!
puts "Property 1 saved"

property = Property.new(rental_status: 'Loué', size: '120', address: '6 Rue Montcalm, 75018, Paris', property_name: 'Appartement au dernier étage', property_type: 'Appartement', property_amount: '240000', user_id: 1)
property.save!
puts "Property 2 saved"

contract = PropertyContract.new(end_date: '12/12/2025', start_date: '12/12/2022', scheduled_payment_date: '12/12/2022', billing_frequency: 'monthly', rent_price: '2300', rent_payment_status: 'true', user_id: 2, property_id: 1)
contract.save!
puts "PropertyContract 1 saved"

contract = PropertyContract.new(end_date: '19/05/2023', start_date: '19/05/2020', scheduled_payment_date: '19/05/2020', billing_frequency: 'weekly', rent_price: '1590', rent_payment_status: 'false', user_id: 3, property_id: 2)
contract.save!
puts "PropertyContract 2 saved"

message = Message.new(content: 'Hello. Je viens de vous accepter pour habiter chez nous.', user_id: 1, property_contract_id: 1)
message.save!
puts "Message 1 saved"

message = Message.new(content: 'Merci beaucoup. Très content de pouvoir faire la fête chez vous !', user_id: 2, property_contract_id: 1)
message.save!
puts "Message 2 saved"

message = Message.new(content: 'Molo mon coco quand même !', user_id: 1, property_contract_id: 1)
message.save!
puts "Message 3 saved"

balance = BalanceSheet.new(amount: '123', type: 'Dépense', type_description: 'Charges de copropriétés', paid: 'true', payment_date: '01/12/2022', balance: '-123', property_contract_id: 1)
balance.save!
puts "Balance 1 saved"

balance = BalanceSheet.new(amount: '2300', type: 'Recette', type_description: 'Loyer', paid: 'true', payment_date: '12/12/2022', balance: '2177', property_contract_id: 1)
balance.save!
puts "Balance 2 saved"


balance = BalanceSheet.new(amount: '89', type: 'Dépense', type_description: 'Charge exceptionnelle', paid: 'false', payment_date: '28/12/2022', balance: '2177', property_contract_id: 1)
balance.save!
puts "Balance 3 saved"
