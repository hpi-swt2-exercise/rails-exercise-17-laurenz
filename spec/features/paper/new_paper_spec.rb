require 'rails_helper'

describe "New author page", type: :feature do

    it "should render without error" do
        author = FactoryGirl.create :author
        visit new_author_paper_path(author)
    end

end
