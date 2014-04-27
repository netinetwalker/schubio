# Title: Simple Tag to assign the posts varable
# Author: Dennis Schubert, <mail@dennis-schubert.de>
#
# Description: A simple tag to assign the posts variable with some filters
#
# Syntax: {% assign_posts show: *mode* %}
#   Mode can be one of:
#     - `normal`: shows only published, non-shy posts
#     - `all`: shows all posts, even drafts and shy ones
#     - `shy`: shows only posts with `shy: true`
#     - `draft`: shows only drafts (`draft: true`)

module Jekyll
  class AssignPostsTag < Liquid::Tag
    SETTINGS_REGEX = /(?<key>\w*):\s*(?<value>\w*)[,\s]*/

    def initialize(tag_name, markup, options)
      super
      @settings = {
        :show => 'normal'
      }
      markup.scan SETTINGS_REGEX do |key, value|
        @settings[key.to_sym] = value
      end
    end

    def render(context)
      all = context.registers[:site].posts
      if @settings[:show]['all']
        posts = all
      else
        posts = all.select do |post|
          case @settings[:show]
            when 'shy' then (post.data['shy'] && !post.data['draft'])
            when 'draft' then (post.data['draft'])
            else (!post.data['shy'] && !post.data['draft'])
          end
        end
      end
      context.scopes.last['posts'] = posts.reverse
      ''
    end
  end
end

Liquid::Template.register_tag('assign_posts', Jekyll::AssignPostsTag)
