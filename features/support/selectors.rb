module HtmlSelectorsHelpers
  # Maps a name to a selector. Used primarily by the
  #
  #   When /^(.+) within (.+)$/ do |step, scope|
  #
  # step definitions in web_steps.rb
  #
  def selector_for(locator)
    case locator

    when /the "([^"]+)" accordion section/
      [:xpath, Bermuda::XPath.accordion_content($1)]
    when /the "([^"]+)" dialog/
      [:xpath, Bermuda::XPath.dialog_content($1)]
    when /the "([^"]+)" tab/
      [:xpath, Bermuda::XPath.tab_content($1)]

    else
      raise "Can't find mapping from \"#{locator}\" to a selector.\n" +
        "Now, go and add a mapping in #{__FILE__}"
    end
  end
end

World(HtmlSelectorsHelpers)
