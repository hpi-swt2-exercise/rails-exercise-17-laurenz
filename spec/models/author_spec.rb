require 'rails_helper'

describe "Author model", type: :model do

    it "should get created with correct data" do
        author = Author.new(first_name: "Alan", last_name: "Turing", homepage: "http://wikipedia.org/Alan_Turing")

        expect(author.first_name).to eq("Alan")
        expect(author.last_name).to eq("Turing")
        expect(author.homepage).to eq("http://wikipedia.org/Alan_Turing")
    end

    it "should return full name" do
        author = Author.new(first_name: "Alan", last_name: "Turing", homepage: "http://wikipedia.org/Alan_Turing")

        expect(author.name).to eq("Alan Turing")
    end

    it "should not validate without last name" do
        invalid = Author.new(first_name: "Alan", last_name: "", homepage: "http://wikipedia.org/Alan_Turing").valid?
        expect(invalid).to eq(false)

        valid = Author.new(first_name: "Alan", last_name: "Turing", homepage: "http://wikipedia.org/Alan_Turing").valid?
        expect(valid).to eq(true)
    end

    it "should be able to have many papers" do
        author = FactoryGirl.create :author
        paper = FactoryGirl.create :paper

        author.papers << paper
    end

end
