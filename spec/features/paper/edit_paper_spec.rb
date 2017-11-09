require 'rails_helper'

describe "Edit paper page", type: :feature do

    it "should save changes" do
        paper = FactoryGirl.create :paper
        visit edit_paper_path(paper)

        fill_in 'Title', with: 'BEAUTIFUL DATA, BEAUTIFUL MIND'
        click_button 'Update Paper'
    end

    it "should allow to select 5 authors from 5 separate drop downs" do
        paper = FactoryGirl.create :paper
        visit edit_paper_path(paper)

        expect(page).to have_field("Author 1")
        expect(page).to have_field("Author 2")
        expect(page).to have_field("Author 3")
        expect(page).to have_field("Author 4")
        expect(page).to have_field("Author 5")
    end

    it "should save selected authors" do
        author = FactoryGirl.create :author
        paper = FactoryGirl.create :paper
        visit edit_paper_path(paper)

        select author.name, from: 'Author 1'
        click_button 'Update Paper'
        expect(paper.authors[0]).to eq(author)
    end

end
