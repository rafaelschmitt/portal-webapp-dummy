puts "--- process PID ------------------------------------------"
system("echo $$")
puts "--- git version ------------------------------------------"
system("git --version")
puts "--- process env ------------------------------------------"
system("xargs --null --max-args=1 echo < /proc/$$/environ")
puts "--- $PATH ------------------------------------------"
system("echo $PATH")
puts "--- env --------------------------------------------"
system("env")
puts "----------------------------------------------------"
system("which git")
puts "----------------------------------------------------"
system("pwd")
puts "----------------------------------------------------"

system "npm install --production"
Deployman::Parser::Yaml.setParameter("#{$config['dest']}/app/config/parameters.yml", '["parameters"]["assets_version"]', SecureRandom.hex)

if $config.has_key? 'mediadb_path'
    system "ln -s #{$config['mediadb_path']} app/mediadb"
else
    system "ln -s /dataApplication/sites/#{$config['customer']}/data/media app/mediadb"
end

# postsetup tasks
task = Deployman::App::Postsetup.newTask
task.title = "database"
task.desc = "do database stuff"
task.commands = [
	"php app/console doctrine:database:create",
	"php app/console doctrine:schema:update --dump-sql",
	"php app/console doctrine:schema:update --force",
	"echo 'y' | php app/console doctrine:fixtures:load"
]

task = Deployman::App::Postsetup.newTask
task.title = "other stuff"
task.desc = "just do the other stuff"
task.commands = [
	"php otherstuff"
]

puts "--- process PID ------------------------------------------"
system("echo $$")
puts "--- git version ------------------------------------------"
system("git --version")
puts "--- process env ------------------------------------------"
system("xargs --null --max-args=1 echo < /proc/$$/environ")
puts "--- $PATH ------------------------------------------"
system("echo $PATH")
puts "--- env --------------------------------------------"
system("env")
puts "----------------------------------------------------"
system("which git")
puts "----------------------------------------------------"
system("pwd")
puts "----------------------------------------------------"