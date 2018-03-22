server '45.33.72.247', user: 'deploy', roles: %w{web app db}

set :deploy_to, '/home/deploy/200e62/full/production'
set :branch, :master
