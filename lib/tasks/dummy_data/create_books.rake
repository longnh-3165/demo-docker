namespace :dummy_data do
  task create_books: :environment do
    puts "Running dummy_data:create_books"
    Category.create name: Faker::Name.unique.name

    books = (1..50).to_a.map do
      Book.new name: Faker::Name.unique.name, category: Category.first
    end
    Book.import! books

    puts "Created dummy_data:create_books success !"
  end
end
