namespace :dev do
  desc "TODO"
  task setup: :environment do
    p "Creating kinds..."

    kinds = %w(Amigo Comercial Conhecido)
    kind_objects = kinds.map do |kind|
      Kind.create!(description: kind)
    end
    p "kinds created!"

    p "Creating 10 contacts..."
    10.times do
      Contact.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        birthdate: Faker::Date.birthday(min_age: 18, max_age: 65),
        kind: kind_objects.sample # Associar cada contato a um tipo aleatório
      )
    end
    p "contacts created!"
  end
end
