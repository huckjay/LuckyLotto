require 'spec_helper'

describe "Static Pages" do

#Checks using have_content - quite general, just picks up any text it finds in the html

	describe "Help page" do
		it "should have the content 'Help'" do
			visit help_path
			page.should have_content('Help')
		end
	end

	describe "Contact page" do
		it "should have the content 'Contact'" do
			visit contact_path	# 	'static_pages/contact'
			page.should have_content('Contact')
		end
	end

	describe "About page" do
		it "should have the content 'About'" do
			visit about_path
			page.should have_content('About')
		end
	end

	describe "Home page" do
		it "should have the content 'Help'" do
#			visit '/static_pages/home'
			visit root_path
			page.should have_content('Home')
		end
	end

#Checks using have_selector - more specific, will check the h1 tag for specific text

	describe "Home page" do
		before { visit root_path }

		it "should have the h1 'Home'" do
#			visit root_path	-	no longer needed as we have used the before so all methods in this block will visit root_path
			page.should have_selector('h1', :text =>"Luck \"E\" Lottery page")
		end

		it "should have a title 'Home'" do
			page.should have_selector('title', :text => "Lucky Lotto App")
		end

# WHAT IS THIS???
		it "should not have a custom page title" do
			page.should_not have_selector('title', :text => '| Home')
		end

	end

	describe "Help page" do
		before { visit help_path }

		it "should have the h1 'Help'" do
			page.should have_selector('h1', :text =>"Help")
		end

		it "should have a title 'Help'" do
			page.should have_selector('title', :text => "Help")
		end

	end

	it "should have the right links on the layout" do
		visit root_path
		click_link "Sign up here"
		page.should have_selector 'title', text: full_title('Sign up')
		click_link "About"
		page.should have_selector 'title', text: full_title('About')
		click_link "Contact"
		page.should have_selector 'title', text: full_title('Contact')

	
	end

end


=begin !!!!	Useful !!!

	it "" do
	end

	describe "" do
	end

	page.should have_selector()

=end
