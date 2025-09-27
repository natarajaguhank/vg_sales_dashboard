-- Loading data from the csv file

\copy vg_sales FROM '/docker-entrypoint-initdb.d/vgsales.csv' CSV HEADER;