require 'spec_helper'

describe "Articles" do

  describe "GET /articles" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get articles_path
      response.status.should be(200)
    end
  end

  describe "create article" do
    it "should create an article" do
      Article.create!(name: "Test Article")
      visit articles_path
      page.should have_content("Test Article")
    end
  end

  describe "create article by filling form" do
    it "should create an article" do
      visit articles_path
      click_link 'New Article'
      fill_in 'Name', with: "another new article for testing"
      fill_in 'Image', with: "article1.png"
      click_button 'Create Article'
      page.should have_content("another new article for testing")
      save_and_open_page
    end
  end

  describe "Index page" do
    it "should have the content 'Listing articles'" do
      visit '/articles/'
      page.should have_content('Listing articles')
    end
  end

  describe "new page" do
    it "should have the content 'New article'" do
      visit '/articles/new'
      page.should have_content('New article')
    end
  end
end
