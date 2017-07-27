require 'rails_helper'

RSpec.feature "User can view all products" do
  scenario "on the products index page" do
    brand = Brand.create(name: "apple")
    product1 = Product.create(name: "prod1", description: "Awesome stuff", price: 500, brand_id: brand.id)
    product2 = Product.create(name: "prod2", description: "Also sick", price: 200, brand_id: brand.id)

    visit products_path

    expect(page).to have_content(product1.name)
    expect(page).to have_content(product1.description)
    expect(page).to have_content(product1.price)

    expect(page).to have_content(product2.name)
    expect(page).to have_content(product2.description)
    expect(page).to have_content(product2.price)
  end
end
