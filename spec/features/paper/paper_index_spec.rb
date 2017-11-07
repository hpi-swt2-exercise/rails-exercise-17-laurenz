require 'rails_helper'

describe "Paper index page", type: :feature do

    it "should render" do
        visit papers_path
    end

    it "should list title, venue, and year of papers" do
        paper = FactoryGirl.create :paper
        visit papers_path

        expect(page).to have_content(paper.title)
        expect(page).to have_content(paper.venue)
        expect(page).to have_content(paper.year)
    end

    it "should link to paper page" do
        paper = FactoryGirl.create :paper
        visit papers_path

        expect(page).to have_link("Show")
    end

    it "should allow editing papers" do
        paper = FactoryGirl.create :paper
        visit papers_path

        expect(page).to have_link("Edit")
    end

end
