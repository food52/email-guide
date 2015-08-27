# Use Bourbon for SASS mixins and helpers
require "bourbon"
require "premailer"

# KSS Styleguide Configuration
set :markdown_engine, :redcarpet
activate :kss, :kss_dir => 'stylesheets/modules',
  :styleblock_path => 'styleblocks'

# Reload page when saving SCSS, CoffeeScript or HTML files
activate :livereload

page "/styleguide/*", layout: "styleguide"

# Helpers
###

# Methods defined in the helpers block are available in templates
helpers do
  # Calculate the years for a copyright
  def copyright_years(start_year)
    end_year = Date.today.year
    if start_year == end_year
      start_year.to_s
    else
      start_year.to_s + '-' + end_year.to_s
    end
  end
end

module PreMailer
  class << self
    def registered(app)
      require "premailer"
      app.after_build do |builder|
        prefix = build_dir + File::SEPARATOR
        Dir.chdir(build_dir) do
          Dir.glob('**/*.html') do |file|
            premailer = Premailer.new(file, :warn_level => Premailer::Warnings::SAFE, :adapter => :nokogiri, :preserve_styles => true, :remove_ids => false)
            unless File.path(file).include? "styleguide" # Do not let premailer inline styles for styleguide section
              fileout = File.open(file, "w")
              fileout.puts premailer.to_inline_css
              fileout.close
              premailer.warnings.each do |w|
                builder.say_status :premailer, "#{w[:message]} (#{w[:level]}) may not render properly in #{w[:clients]}"
              end
              builder.say_status :premailer, prefix+file
            end
          end
        end
      end
    end
    alias :included :registered
  end
end

::Middleman::Extensions.register(:inline_premailer, PreMailer)

activate :inline_premailer

configure :build do
  # Minify CSS on build
  activate :minify_css

  # Minify Javascript on build
  activate :minify_javascript

  # Use relative URLs
  activate :relative_assets

end

