#begin
require "rubygems"
require "watir-webdriver"
browser = Watir::Browser.new :ff

#arrays
pages = ["http://retirementmadesimpler.org/Dev/BC/BC_Test_WithGA.html",
		  "http://retirementmadesimpler.org/Dev/BC/BC_Test_FINRA.html",
		  "http://cdn.qa.finra.org/bcwidget/",
		  "http://cdn.qa.finra.org/bcwidget/index_480.html",
		  "http://cdn.qa.finra.org/bcwidget/index_finra.html"]

=begin
pages = 
["http://retirementmadesimpler.org/Dev/BC/BC_Test1.html",
		  "http://retirementmadesimpler.org/Dev/BC/BC_Test2.html",
		  "http://retirementmadesimpler.org/Dev/BC/BC_Test3.html",
		  "http://retirementmadesimpler.org/Dev/BC/BC_Test4.html", 
		  "http://retirementmadesimpler.org/Dev/BC/BC_Test_WithGA.html",
		  "http://retirementmadesimpler.org/Dev/BC/BC_Test_FINRA.html",
		  "http://cdn.qa.finra.org/bcwidget/",
		  "http://cdn.qa.finra.org/bcwidget/index_480.html",
		  "http://cdn.qa.finra.org/bcwidget/index_finra.html"]
=end

#loops
10.times do
	pages.each do |page|
		browser.goto page
		sleep 2
		browser.text_field(:id => "finra_pc_search_box").when_present.set ARGV[1] || "smith"
		browser.ul(:class => "ui-autocomplete").li(:class => "ui-menu-item", :index => ARGV[0].to_i).when_present.click
		sleep 3
	end
puts "Successful completion of automation script"
end
browser.close
#end