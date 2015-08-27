# URL
heroku_url = "http://f52-emails.herokuapp.com/"

# Deploys to Heroku
multitask :heroku do
  puts "## Deploying to Heroku"
  puts "\n## Pushing to #{heroku_url}"
  system "git push heroku master"
end

namespace :heroku do
  desc "Push source to Heroku and build"
    task :deploy => [:heroku] do
  end
end

namespace :assets do
  task :precompile do
    sh "middleman build"
  end
end

