namespace :dummy_data do
  task create_films: :environment do
    puts "Running dummy_data:create_films"
    Category.create name: Faker::Name.unique.name

    films = (1..50).to_a.map do
      Film.new name: Faker::Name.unique.name, category: Category.first
    end
    Film.import! films

    puts "Created dummy_data:create_films success !"
  end
end
