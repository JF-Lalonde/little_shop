require 'rails_helper'

RSpec.feature "Admin can create products" do
  scenario "with valid attributes" do
  
    visit new_product_path
    fill_in "product[name]", with: "product1"
    fill_in "product[description]", with: "sick product"
    fill_in "product[price]", with: 500
    
    product = Product.last

    expect(current_path).to eq(product_path(product))
    expect(page).to have_content("product1")
    expect(page).to have_content("sick product")
    expect(page).to have_content(500)
  end
end
