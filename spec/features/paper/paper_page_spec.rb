require 'rails_helper'

describe "Paper page", type: :feature do

    it "should show the papers details" do
        paper = FactoryGirl.create :paper
        visit paper_path(paper)

        expect(page).to have_content(paper.title)
        expect(page).to have_content(paper.venue)
        expect(page).to have_content(paper.year)
    end

    it "should list all authors" do
        author = FactoryGirl.create :author
        paper = FactoryGirl.create :paper
        paper.authors << author

        visit paper_path(paper)
        expect(page).to have_content(author.name)
    end

end
