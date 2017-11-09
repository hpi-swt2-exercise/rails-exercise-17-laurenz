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

    it "should allow filtering papers" do
        oldPaper = Paper.new(title: "Everything Is Black And White", venue: "TrackMeDownValley", year: 1950)
        oldPaper.save
        newPaper = Paper.new(title: "Everything Is Colorful", venue: "WhereAmI", year: 1951)
        newPaper.save
        visit papers_path+"?year=1950"

        expect(page).to have_content(oldPaper.title)
        expect(page).to have_no_content(newPaper.title)
    end

end
