require 'rails_helper'

describe "Edit paper page", type: :feature do

    it "should save changes" do
        paper = FactoryGirl.create :paper
        visit edit_paper_path(paper)

        fill_in 'Title', with: 'BEAUTIFUL DATA, BEAUTIFUL MIND'
        click_button 'Update Paper'
    end

end
