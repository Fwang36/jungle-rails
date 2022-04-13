require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true  do

  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
        )
      end
    end

    scenario "They see the add cart page" do
      visit '/cart'

      save_screenshot
      expect(page).to have_selector 'section.cart-show'
    end

    scenario "it should update cart when button is clicked" do
      visit root_path

      find("form.button_to", match: :first).click
      save_screenshot

      expect(page).to have_content('My Cart (1)')
    end

    scenario "They should see item in the cart when added" do
      visit root_path

      find("form.button_to", match: :first).click
      save_screenshot

      visit '/cart'
      expect(page).to have_selector("h4")
    end
end
