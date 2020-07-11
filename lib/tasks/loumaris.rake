# frozen_string_literal: true

namespace :loumaris do
  namespace :development do
    desc 'start up in development mode'
    task start: [:up]
  end

  desc 'start up in production mode'
  task start: ['db:migrate', :up]

  desc 'start rails in prod env'
  task up: :environment do
    File.delete('/app/tmp/pids/server.pid') if File.exist?('/app/tmp/pids/server.pid')
    sh 'rails s -b 0.0.0.0 -p 3000'
  end

  desc 'run test suite'
  task testsuite: ['db:create', 'db:migrate', :rubocop]

  desc 'run rubocop'
  task rubocop: :environment do
    sh "cd #{Rails.root}; rubocop"
  end
end
