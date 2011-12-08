namespace :dev do
  desc "Rebuild system"
  task :build => ["tmp:clear", "log:clear", "db:drop", "db:create", "db:migrate", "db:seed" ]
  desc "create Roles"
  task :create_roles  => :environment  do 
    Role.create!(:name => "Admin")
    Role.create!(:name => "User")
  end
end