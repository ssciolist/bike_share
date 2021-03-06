require 'rails_helper'

describe 'As a registered user' do
  describe 'when I visit /cart' do
    it 'I see accessory attributes, subtotal and quantity, and cart total' do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      accessory = create(:accessory)

      visit bike_shop_path

      click_on 'Add to Cart'
      visit '/cart'

      within('li.cart') do
        expect(page).to have_content("1")
      end
      expect(page).to have_content("Quantity: 1")
      expect(page).to have_content("Subtotal: $9.99")
      expect(page).to have_content("Total: $9.99")

    end

    it 'I can click checkout and see my dashboard with a flash message' do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      accessory = create(:accessory)

      visit bike_shop_path

      click_on 'Add to Cart'
      visit '/cart'
      click_on 'Checkout'

      fill_in 'order[purchaser_name]', with: 'Megan Marie'
      fill_in 'order[address]', with: 'JK Street'
      click_on 'Create Order'

      expect(current_path).to eq(dashboard_path)
      expect(page).to have_content('Successfully submitted your order totalling $9.99')
    end
  end
end
