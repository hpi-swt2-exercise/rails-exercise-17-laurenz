require 'rails_helper'

describe "Author index page", type: :feature do

    it "should render" do
        visit index_author_path
    end

end
