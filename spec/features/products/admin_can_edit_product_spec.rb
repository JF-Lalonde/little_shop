require 'rails_helper'

RSpec.feature "Admin can edit a product" do
  scenario "when authenticated, admin can edit product attributes" do

    brand = Brand.create!(name: "microsoft")
    product = Product.create!(name: "Laptop4", description: "It shows moving pictures", price: 5.00, image_path: "https://img.bbystatic.com/BestBuy_US/images/products/1738/1738727_sa.jpg", brand_id: brand.id)

    visit edit_product_path

    fill_in "product[name]", with: "product1"
    fill_in "product[description]", with: "sick product"
    fill_in "product[price]", with: 500
    select "samsung", from: "product_brand_id"

    check("laptops")
    check("monitors")

    click_on "Update Product"

    expect(current_path).to eq(products_path)
    expect(page).to have_content("product1")
    expect(page).to have_content("sick product")
    expect(page).to_not have_content("Laptop4")
  end

end
