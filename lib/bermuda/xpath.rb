require 'xpath'

module XPath
  class Expression
    class Includes < Binary
      # http://pivotallabs.com/users/alex/blog/articles/427-xpath-css-class-matching
      def to_xpath(predicate=nil)
        "contains(concat(' ', normalize-space(#{@left.to_xpath(predicate)}), ' '), concat(' ', #{@right.to_xpath(predicate)}, ' '))"
      end
    end

    def includes(expression)
      Includes.new(current, expression)
    end
  end
end

module Bermuda
  module XPath
    include ::XPath
    extend self

    def accordion_header(title = nil, options = {})
      xpath = descendant[attr(:class).includes('ui-accordion-header')]

      if options.key?(:active)
        state = attr(:class).includes('ui-state-active')
        state = ~state unless options[:active]
        xpath = xpath[state]
      end

      xpath = xpath[descendant(:a).text.is title] if title
      xpath
    end

    def accordion_content(title = nil, options = {})
      accordion_header(title, options).next_sibling
    end
  end
end
