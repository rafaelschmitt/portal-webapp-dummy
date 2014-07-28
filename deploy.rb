# postsetup tasks
newTask (
	"database", 
	"do database stuff blablado database stuff blablado database stuff blablado database stuff ", 
	[
		"php app/console doctrine:database:create", 
		"php app/console doctrine:schema:update --dump-sql", 
		"php app/console doctrine:schema:update --force", 
		"echo 'y' | php app/console doctrine:fixtures:load"
	]
)

newTask (
	"other stuff", 
	"just do this other stuff", 
	[
		"otherstuff command1", 
	]
)
