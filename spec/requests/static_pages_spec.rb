require 'spec_helper'

describe "Static Pages" do

#Checks using have_content - quite general

	describe "Help page" do
		it "should have the content 'Help'" do
			visit '/static_pages/help'
			page.should have_content('Help')
		end
	end

	describe "Home page" do
		it "should have the content 'Help'" do
			visit '/static_pages/home'
			page.should have_content('Home')
		end
	end

#Checks using have_selector - more specific

	describe "Home page" do

		it "should have the h1 'Home'" do
			visit '/static_pages/home'
			page.should have_selector('h1', :text =>"HomePage")
		end

		it "should have a title 'Home'" do	
			visit '/static_pages/home'
			page.should have_selector('title', :text => "Home")
		end

	end

	describe "Help page" do

		it "should have the h1 'Help'" do
			visit '/static_pages/help'
			page.should have_selector('h1', :text =>"Help")
		end

		it "should have a title 'Help'" do	
			visit '/static_pages/help'
			page.should have_selector('title', :text => "Help")
		end

	end

end


=begin !!!!	Useful !!!

	it "" do
	end

	describe "" do
	end

	page.should have_selector()

=end
