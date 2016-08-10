# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

session = GoogleDrive::Session.from_config("config.json")
session.spreadsheet_by_key("1m_x4ZtQzTHYldutf_i90uXSfKfEjFXSPvyV_L58nDJ0").worksheets.each do |sheet|
  type = sheet.title
  sheet.rows(1).each do |row|
  sock =  Product.create!(
    name: row[0],
    color: row[1],
    style: row[2],
    price: row[5].delete("$").to_i * 100,
    image: row[6],
    category: type,
    materials: row[7] || type.delete(" Socks"),
    remote_product_image_url: row[6],
    description: row[8]
    )

    sizeandquality = row[4].split(", ").map{|x| x.split(": ")}.each do |size|
      newsize = Size.find_or_create_by(size: size[0])
      sock.sizings << Sizing.new(
      size: newsize,
      quantity: size[1]
      )
    end

  end

end

OrderStatus.create! name: "In Progress"
OrderStatus.create! name: "Billing"
OrderStatus.create! name: "Placed"
OrderStatus.create! name: "Shipping"
OrderStatus.create! name: "Completed"
