require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "selectors"))

module WithinHelpers
  def with_scope(locator)
    locator ? within(*selector_for(locator)) { yield } : yield
  end
end
World(WithinHelpers)

# Single-line step scoper
When /^(.*) within ([^:]+)$/ do |step, parent|
  with_scope(parent) { When step }
end

# Multi-line step scoper
When /^(.*) within ([^:]+):$/ do |step, parent, table_or_string|
  with_scope(parent) { When "#{step}:", table_or_string }
end

When /^I visit the (.+) page$/ do |page|
  visit("/#{page}.html")
end

Then /^I should see "([^"]+)"$/ do |text|
  page.should have_content(text)
end

When /^I press "([^"]*)"$/ do |button|
  click_button(button)
end

When /^(?:|I )fill in "([^"]*)" with "([^"]*)"$/ do |field, value|
  fill_in(field, :with => value)
end

Then /^the "([^"]*)" field should contain "([^"]*)"$/ do |field, value|
  find_field(field).value.should == value
end
