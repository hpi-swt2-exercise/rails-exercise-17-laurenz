require 'rails_helper'

describe "Author index page", type: :feature do

    it "should render" do
        visit authors_path
    end

    it "should display full name of authors in collumn" do
        author = FactoryGirl.create :author
        visit authors_path

        expect(page).to have_content("Name")
        expect(page).to have_content(author.name)
    end

end