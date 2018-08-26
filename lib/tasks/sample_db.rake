namespace :sample_db do
  desc "Basic sample models for testing"
  task generate: :environment do
    Restaurant.create(name: 'Centrales', opening_hour: '7:00', closing_hour: '20:00', active_days: ['all'])
    Restaurant.create(name: 'Jubileo', opening_hour: '9:00', closing_hour: '5:00', active_days: ['mon', 'tue', 'wed', 'thu', 'fri'])

    Restaurant.find_each do |r|
      Product.create(name: r.name, restaurant: r, name: 'Chilaquiles', price: 34)
      Product.create(name: r.name, restaurant: r, name: 'Hamburguesa', price: 60)
      Product.create(name: r.name, restaurant: r, name: 'Agua', price: 10)
      Product.create(name: r.name, restaurant: r, name: 'Tostitos', price: 12.50)
      Product.create(name: r.name, restaurant: r, name: 'Coca Cola', price: 15.20)
    end
  end

  task make_user: :environment do
  end

  task destroy: :environment do
    Restaurant.delete_all
    Purchase.delete_all
    Product.delete_all
  end
end
