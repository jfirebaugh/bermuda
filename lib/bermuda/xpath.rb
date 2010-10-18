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

    def autocompletion(text = nil)
      xpath = descendant[attr(:class).includes('ui-autocomplete')]
      xpath = xpath.descendant[attr(:class).includes('ui-menu-item')]
      xpath = xpath[descendant(:a).text.is text] if text
      xpath
    end

    def dialog(title = nil)
      xpath = descendant[attr(:class).includes('ui-dialog')]
      xpath = xpath[descendant[attr(:class).includes('ui-dialog-title')].text.is title] if title
      xpath
    end

    def dialog_content(title = nil)
      dialog(title).descendant[attr(:class).includes('ui-dialog-content')]
    end

    def progressbar(options = {})
      xpath = descendant[attr(:class).includes('ui-progressbar')]
      xpath = xpath[attr(:'aria-valuenow') == options[:value]] if options[:value]
      xpath
    end

    def tab_header(title = nil, options = {})
      xpath = descendant[attr(:class).includes('ui-tabs-nav')].child

      if options.key?(:active)
        state = attr(:class).includes('ui-state-active')
        state = ~state unless options[:active]
        xpath = xpath[state]
      end

      xpath = xpath[descendant(:a).text.is title] if title
      xpath
    end

    def tab_content(title = nil, options = {})
      descendant[Expression::Literal.new("concat('#', @id)") == anywhere(tab_header(title, options)).descendant(:a).attr(:href)]
    end
  end
end
