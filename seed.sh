# to investigate later: how to refactor this script to use RELATIVE PATHS, so that the script can work on another computer, for example an EC2 instance
# https://www.tjelvarolsson.com/blog/using-relative-paths-in-linux-scripts/

# run this seed script to generate 100 million comments and load them into the database

# Add comments to CSV files

#This line changes to current working directory to where the seed.sh file is.
cd "$(dirname "$0")"

echo 'Generating CSV data files...';

node generate-csv.js

echo 'Creating database and table schemas...'

mysql -u root < schema.sql

echo 'Loading CSV data into tables...'

mysql -u root < load-data.sql

echo 'Creating indexes and foreign keys...'

mysql -u root < indexes.sql

echo 'Seed script FINISHED!'