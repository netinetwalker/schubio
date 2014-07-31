# Title: Simple Tag to assign the posts varable
# Author: Dennis Schubert, <mail@dennis-schubert.de>
#   (no. actually this is just a negated version of the original where filter
#   https://github.com/jekyll/jekyll/blob/03bca72af643c1e58b5a48505a51fa3be6d76942/lib/jekyll/filters.rb#L188
#   because I needed it.)
#
# Filter an array of objects
#
# input - the object array
# key - key within each object to filter by
# value - unwanted value
#
# Returns the filtered array of objects
module Jekyll
  module WhereNotFilter
    def where_not(input, property, value)
      return input unless input.is_a?(Array)
      input.select { |object| item_property(object, property) != value }
    end
  end
end

Liquid::Template.register_filter Jekyll::WhereNotFilter
