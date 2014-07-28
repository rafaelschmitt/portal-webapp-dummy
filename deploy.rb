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
