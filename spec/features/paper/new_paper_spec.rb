require 'rails_helper'

describe "New author page", type: :feature do

    it "should render without error" do
        visit new_paper_path
    end

    it "should show validation error" do
        visit new_paper_path

        fill_in 'Venue', with: 'Evergreen Terrace'
        fill_in 'Year', with: '1928'

        click_button 'Save Paper'

        expect(page).to have_content("Title can't be blank")
    end

end
