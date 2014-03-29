# Title: Simple Tag to assign the posts varable
# Author: Dennis Schubert, <mail@dennis-schubert.de>
#
# Description: A simple tag to assign the posts variable with some filters
#
# Syntax: {% assign_posts normal: true, shy: false %}

module Jekyll
  class AssignPostsTag < Liquid::Tag
    SETTINGS_REGEX = /(?<key>\w*):\s*(?<value>\w*)[,\s]*/

    def initialize(tag_name, markup, options)
      super
      @settings = {
        :normal => true,
        :shy => false
      }
      markup.scan SETTINGS_REGEX do |key, value|
        if ['true', 'false'].include? value
          @settings[key.to_sym] = value == 'true'
        else
          @settings[key.to_sym] = value
        end
      end
    end

    def render(context)
      all = context.registers[:site].posts
      if @settings[:normal] && @settings[:shy]
        posts = all
      else
        posts = all.select {|p| !p.data['shy']} if @settings[:normal]
        posts = all.select {|p| p.data['shy']} if @settings[:shy]
      end
      context.scopes.last['posts'] = posts.reverse
      ''
    end
  end
end

Liquid::Template.register_tag('assign_posts', Jekyll::AssignPostsTag)
