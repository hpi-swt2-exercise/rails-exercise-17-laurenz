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

    it "should link to new author page" do
        visit authors_path

        expect(page).to have_link("Add author")
    end


    it "should link to author page" do
        author = FactoryGirl.create :author
        visit authors_path

        expect(page).to have_link("Show")
    end

    it "should allow editing authors" do
        author = FactoryGirl.create :author
        visit authors_path

        expect(page).to have_link("Edit")
    end

    it "should support deleting authors" do
        author = FactoryGirl.create :author
        visit authors_path

        click_link "Destroy"

        visit authors_path
        expect(page).to have_no_content(author.first_name)
        expect(page).to have_no_content(author.last_name)
        expect(page).to have_no_content(author.homepage)
    end


end
