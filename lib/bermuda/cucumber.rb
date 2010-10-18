require 'bermuda/xpath'

# Accordion

Then /^I should see the following accordion sections:$/ do |titles|
  wait_until { page.has_xpath?(Bermuda::XPath.accordion_header) }
  titles.diff!(all(:xpath, Bermuda::XPath.accordion_header).map {|node| [node.text]})
end

Then /^the "([^"]+)" accordion section should be active$/ do |title|
  page.should have_xpath(Bermuda::XPath.accordion_header(title, :active => true))
end

Then /^the "([^"]+)" accordion section should not be active$/ do |title|
  page.should have_xpath(Bermuda::XPath.accordion_header(title, :active => false))
end

When /^I activate the "([^"]+)" accordion section$/ do |title|
  find(:xpath, Bermuda::XPath.accordion_header(title).child(:a)).click
end

# Autocomplete

Then /^I should see the following completions:$/ do |choices|
  pending
end

When /^I select the "([^"]+)" completion$/ do |title|
  pending
end

# Dialog

Then /^I should see the "([^"]+)" dialog$/ do |title|
  page.should have_xpath(Bermuda::XPath.dialog(title), :visible => true)
end

Then /^I should not see the "([^"]+)" dialog$/ do |title|
  page.should_not have_xpath(Bermuda::XPath.dialog(title), :visible => true)
end

When /^I close the "([^"]+)" dialog$/ do |title|
  find(:xpath, Bermuda::XPath.dialog(title), :visible => true).click_link('close')
end

# Progress bar

Then /^the progress bar should be at (\d+)(?: percent|%)$/ do |value|
  pending
end

# Slider

Then /^the slider should be at (\d+)$/ do |value|
  pending
end

When /^I set the slider to (\d+)$/ do |value|
  pending
end

# Tabs

Then /^I should see the following tabs:$/ do |titles|
  titles.diff!(all(:xpath, Bermuda::XPath.tab_header).map {|node| [node.text]})
end

Then /^the "([^"]+)" tab should be active$/ do |title|
  page.should have_xpath(Bermuda::XPath.tab_header(title, :active => true))
end

Then /^the "([^"]+)" tab should not be active$/ do |title|
  page.should have_xpath(Bermuda::XPath.tab_header(title, :active => false))
end

When /^I activate the "([^"]+)" tab$/ do |title|
  find(:xpath, Bermuda::XPath.tab_header(title).child(:a)).click
end
