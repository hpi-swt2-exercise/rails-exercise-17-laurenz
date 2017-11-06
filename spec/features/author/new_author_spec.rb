require 'rails_helper'

describe "New author page", type: :feature do

    it "should render without error" do
        visit new_author_path
    end

    it "should have text input for first name, last name, and homepage" do
        visit new_author_path

        expect(page).to have_field('First name')
        expect(page).to have_field('Last name')
        expect(page).to have_field('Homepage')
    end

    it "should show validation error" do
        visit new_author_path

        fill_in 'First name', with: 'Alan'
        fill_in 'Homepage', with: 'http://wikipedia.de/Alan_Turing'

        click_button 'Save Author'

        expect(page).to have_content("Last name can't be blank")
    end

    it "should accept when all data is provided" do
        visit new_author_path

        fill_in 'First name', with: 'Alan'
        fill_in 'Homepage', with: 'http://wikipedia.de/Alan_Turing'
        fill_in 'Last name', with: 'Turing'

        click_button 'Save Author'

        expect(page).to have_no_content("Last name can't be blank")
    end
end
