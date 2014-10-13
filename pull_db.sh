# pull_db.sh

# run like "sh pull_db.sh"
# or chmod +x pull_db.sh and then you can run as "./pull_db.sh"

heroku pgbackups:capture --app pureshitapi --expire
curl -o latest.dump `heroku pgbackups:url --app pureshitapi`

# recreate empty db
rake db:drop --trace
rake db:create --trace

# restore the db
pg_restore --verbose --clean --no-acl --no-owner -h localhost -d pureshitapi latest.dump
