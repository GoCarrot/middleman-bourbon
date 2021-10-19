# frozen_string_literal: true

require 'middleman-bourbon/version'

module MiddlemanBourbon
  class Extension < Middleman::Extension
    def initialize(app, options_hash = {}, &block)
      require "bourbon"

      gem_dir = Gem::Specification.find_by_name("bourbon").gem_dir

      # add bourbon to sass load path
      Sass.load_paths << File.expand_path("./app/assets/stylesheets", gem_dir)

      puts "Bourbon loaded"
    end
    alias :included :registered
  end
end

::Middleman::Extensions.register(:bourbon, MiddlemanBourbon::Extension)
