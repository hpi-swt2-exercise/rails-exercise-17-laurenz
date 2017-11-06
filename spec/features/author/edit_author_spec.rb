require 'rails_helper'

describe "Edit author page", type: :feature do

    it "should save changes" do
        author = FactoryGirl.create :author
        visit edit_author_path(author)

        fill_in 'Last name', with: 'Torengo'
        click_button 'Update Author'
    end

end
