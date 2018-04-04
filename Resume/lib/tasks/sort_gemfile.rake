namespace :sort_gemfile do
  if Rails.env.development?
    require 'ordinare'
    desc 'Sorts Gemfile A to Z'
    task :perform_sort do
      puts 'Start sort of Gemfile'
      sh 'ordinare'
      puts 'Completed sort of Gemfile'
    end
  end
end
