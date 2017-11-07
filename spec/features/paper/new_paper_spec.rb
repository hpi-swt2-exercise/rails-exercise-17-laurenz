require 'rails_helper'

describe "New paper page", type: :feature do

    it "should render without error" do
        visit new_paper_path
    end

    it "should not validate without title" do
        visit new_paper_path

        fill_in 'Venue', with: 'Evergreen Terrace'
        fill_in 'Year', with: '1928'

        click_button 'Create Paper'

        expect(page).to have_content("Title can't be blank")
    end

    it "should not validate without venue" do
        visit new_paper_path

        fill_in 'Title', with: 'The Making Of Salsa'
        fill_in 'Year', with: '1928'

        click_button 'Create Paper'

        expect(page).to have_content("Venue can't be blank")
    end

    it "should not validate without year" do
        visit new_paper_path

        fill_in 'Title', with: 'The Making Of Salsa'
        fill_in 'Venue', with: 'Evergreen Terrace'

        click_button 'Create Paper'

        expect(page).to have_content("Year can't be blank")
    end

    it "should not accept non-integer years" do
        visit new_paper_path

        fill_in 'Title', with: 'The Making Of Salsa'
        fill_in 'Venue', with: 'Evergreen Terrace'
        fill_in 'Year', with: 'Fifth Century before Christ'

        click_button 'Create Paper'

        expect(page).to have_content("Year is not a number")
    end

end
