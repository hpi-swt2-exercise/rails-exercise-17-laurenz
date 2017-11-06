require 'rails_helper'

describe "Author page", type: :feature do

    it "should show the author's first name" do
        author = FactoryGirl.create :author
        visit author_path(author)

        expect(page).to have_content(author.first_name)
    end

end
