require 'rails_helper'

context 'As a visitor' do
  describe "When I visit '/bike-shop'" do
    before(:each) do
      @accessories = create_list(:item, 12)
    end
    scenario 'I see at least 12 bike accessories (items) for sale' do
      visit '/bike-shop'

      @accessories.each do |accessory|
        expect(page).to have_content(accessory.title)
        expect(page).to have_content(accessory.description)
        expect(page).to have_content(accessory.price)
      end
    end

    scenario 'I see a button near each item that says "Add to Cart"' do
      visit '/bike-shop'

      expect(page).to have_button('Add to Cart')
    end

    describe 'When I click "Add to Cart",' do
      scenario 'I see a flash message alerting me that I have added that specific accessory to my cart.' do
        visit '/bike-shop'

        find(".add_item_#{@accessories.first.id}").click

        expect(page).to have_content("You now have 1 #{@accessories.first.title} in your cart")
      end
      scenario 'I also see my cart count updated on all pages' do
        visit items_path
        within('.nav-icon') do
          expect(page).to have_content(0)
        end

        find(".add_item_#{@accessories.first.id}").click

        within('.nav-icon') do
          expect(page).to have_content(1)
        end
        visit root_path

        visit items_path
        find(".add_item_#{@accessories.last.id}").click

        within('.nav-icon') do
          expect(page).to have_content(2)
        end
        visit trips_path
        within('.nav-icon') do
          expect(page).to have_content(2)
        end
      end
    end
  end
end
