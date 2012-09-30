require 'spec_helper'

describe "Initial Pages" do

  describe "Home page" do

    it "should have the h1 'Welcome to the NFL Rails Page'" do
      visit '/initial_pages/home'
      page.should have_selector('h1', :text => 'Welcome to the NFL Rails Page')
    end

    it "should have the title 'Home'" do
      visit '/initial_pages/home'
      page.should have_selector('title',
                                :text => "NFL Rails App | Home")
    end
  end

  describe "Help page" do
    it "should have the h1 'Welcome to the NFL Rails Page'" do
      visit '/initial_pages/help'
      page.should have_selector('h1', :text => 'Help')
    end

    it "should have the title 'Help'" do
      visit '/initial_pages/help'
      page.should have_selector('title',
                                :text => "NFL Rails App | Help")
    end
  end

  describe "About page" do
    it "should have the h1 'About Us'" do
      visit '/initial_pages/about'
      page.should have_selector('h1', :text => 'About Us')
    end

    it "should have the title 'Home'" do
      visit '/initial_pages/about'
      page.should have_selector('title',
                                :text => "NFL Rails App | About")
    end
  end

  describe "Contact page" do

    it "should have the h1 'Contact'" do
      visit '/initial_pages/contact'
      page.should have_selector('h1', :text => 'Contact')
    end

    it "should have the title 'Contact'" do
      visit '/initial_pages/contact'
      page.should have_selector('title', :text => "NFL Rails App | Contact")
    end
  end

end
