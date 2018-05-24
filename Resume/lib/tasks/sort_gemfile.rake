namespace :sort_gemfile do
  if Rails.env.development?
    require 'ordinare'
    desc 'Sorts Gemfile A to Z'
    task :perform_sort do
      puts 'Checking if sorted'
      begin
        Ordinare::Check.gemfile_sorted?
      rescue SystemExit => e
        puts "#{e}. Sorting now...."
        #sh 'ordinare'
        Ordinare::Sort.sort_gemfile
        puts 'Completed sort of Gemfile'
      end
    end
  end
end
