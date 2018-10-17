namespace :utils do
  desc "Popular Banco de Dados"
  task seed: :environment do
    puts "--- Gerando os tipos de contato (Kinds)... ---"
      Kind.create([{description: "Amigo"}, {description: "Contato"}, {description: "Comercial"}])
    puts "Gerando os tipos de contato (Kinds)... [OK]"

    puts "--- Gerando os contatos (Contacts)... ---"
      Contact.create(
        name: "Robson",
        email: "robson@email.com.br",
        kind: Kind.all.sample,
        # .sample pega um exemplo / amostra
        rmk: "minha observação"
      )
    puts "Gerando os contatos (Contacts)... [OK]"

    puts "--- Gerando os contatos com a gem Faker... ---"
    100.times do |i|
      Contact.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        kind: Kind.all.sample,
        # .sample pega um exemplo / amostra
        rmk: LeroleroGenerator.sentence([1,2,3].sample)
      )
    end
    puts "Gerando os contatos com a gem Faker... [OK]"

    puts "--- Gerando os endereços (Addresses)... ---"
    Contact.all.each do |contact|
      Address.create!(
        street: Faker::Address.street_address,
        city: Faker::Address.city,
        state: Faker::Address.state_abbr,
        contact: contact
      )
    end
    puts "Gerando os endereços (Addresses)... [OK]"

    puts "--- Gerando os telefones (Phones)... ---"
    Contact.all.each do |contact|
      Random.rand(1..5).times do |i|
        Phone.create!(
          phone: Faker::PhoneNumber.phone_number,
          contact: contact
        )
      end
    end
    puts "Gerando os telefones (Phones)... [OK]"
  end
end
