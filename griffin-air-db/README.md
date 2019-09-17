# Griffin Air DB

The Griffin Air DB is intended to run as a docker container providing a mySQL Database with the Griffin Air Schema.

## Create the Griffin Air DB Docker image

```console
$ cd griffin-air-db/

$ docker build -t griffinair-db:1.0.0 .

Sending build context to Docker daemon  7.168kB
Step 1/2 : FROM mysql:5.7.24
 ---> ba7a93aae2a8
Step 2/2 : COPY ./sql-scripts/ /docker-entrypoint-initdb.d/
 ---> fb5ec0b397a2
Successfully built fb5ec0b397a2
Successfully tagged griffinair-db:1.0.0
```

## Start the Griffin Air Db Docker container from the image

`$ docker run -d --rm --name griffin-air-db -e MYSQL_ROOT_PASSWORD=axway -p 3307:3306 griffinair-db:1.0.0`


## Look inside the container and inspect the GriffinAir Database

### Start the containers bash

`$ docker exec -it griffin-air-db bash`

### Connect to the database via mysql client

`# mysql -uroot -p`

### Show databases

```console
mysql> show databases;

+--------------------+
| Database           |
+--------------------+
| information_schema |
| GriffinAir         |
| mysql              |
| performance_schema |
| sys                |
+--------------------+
5 rows in set (0.00 sec)
``` 

### Use GriffinAir Database

```console
mysql> use GriffinAir;
```

### Show tables of  GriffinAir Database

```console
mysql> show tables;
+----------------------+
| Tables_in_GriffinAir |
+----------------------+
| aircraft             |
| schedules            |
+----------------------+
2 rows in set (0.00 sec)
``` 

### Aircraft table

```console
mysql> desc aircraft;
+--------------+--------------------------------+------+-----+----------------------+--------------------------------+
| Field        | Type                           | Null | Key | Default              | Extra                          |
+--------------+--------------------------------+------+-----+----------------------+--------------------------------+
| id           | int(11)                        | NO   | PRI | NULL                 | auto_increment                 |
| icao_code    | varchar(4)                     | YES  |     | NULL                 |                                |
| iata_code    | varchar(3)                     | YES  |     | NULL                 |                                |
| model        | varchar(255)                   | YES  |     | NULL                 |                                |
| manufacturer | varchar(255)                   | YES  |     | NULL                 |                                |
| description  | text                           | YES  |     | NULL                 |                                |
| size         | enum('small','medium','large') | YES  |     | NULL                 |                                |
| lastupdate   | timestamp(6)                   | NO   |     | CURRENT_TIMESTAMP(6) | on update CURRENT_TIMESTAMP(6) |
+--------------+--------------------------------+------+-----+----------------------+--------------------------------+
8 rows in set (0.02 sec)
```


