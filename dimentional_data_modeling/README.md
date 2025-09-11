### To run postgres with pgAdmin
 - run `docker-compose up -d` or remove -d for removing detach mode or run `make up` with Makefile
 - In the pgAdmin UI log in use environments file for login 
 - When registering new server for General Name use local host as name or use choice in the connections tap use postgres for Host name/ Address and Password


## saved sql scripts
- lab sql scripts are saved in `live_sql` folder, until i figure out docker file permisions with the host in automatic loading and saving in the host machine

### Structure
- docker-compose.yaml runs postgres and pgAdmin docker containers
- data.dump is for loading the players_season data tables automatically with the help of `scripts/init-db.sh` 
- example.env used for env variables as .env is ignored in gitignore as safety measure when adding additonal api variables
- Makefile used for one line easy runs 
- live_sql used for saving sql script files for the labs