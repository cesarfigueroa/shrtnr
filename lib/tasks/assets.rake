namespace :assets do
  task :stylesheets do
    flags = '--watch --style=compressed'
    files = {
      :input => 'app/assets/stylesheets/application.scss',
      :output => 'public/assets/stylesheets/application.css'
    }

    system "sass #{flags} #{files[:input]}:#{files[:output]}"
  end

  task :javascripts do
    flags = '--watch --compile --join'
    input_dir = 'app/assets/javascripts'
    output_file = 'public/assets/javascripts/application.js'
    # dirs = {
    #   :input => 'app/assets/javascripts',
    #   :output => 'public/assets/javascripts'
    # }

    system "coffee #{flags} #{output_file} #{input_dir}"
  end

  desc 'Compile all assets'
  multitask :compile => [:javascripts, :stylesheets]
end
