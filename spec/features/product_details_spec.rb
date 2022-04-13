require 'rails_helper'

RSpec.feature "Visitor navigates to home page", type: :feature, js: true do

    # SETUP
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

    scenario "They see the product" do
      visit "/products/1"
  
      # commented out b/c it's for debugging only
      # save_and_open_screenshot
      save_screenshot
      expect(page).to have_css 'main section.products-show', count: 1
    end
  
    scenario "They should get here by clicking on a product from the homepage" do
      visit root_path

      find("h4", match: :first).click
      expect(page).to have_css 'main section.products-show', count: 1
    end
end