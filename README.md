# Football World Cup Database created using PostgreSQL
This repository contains the code used to create a Relaitional Database that focuses on the topic of World Cup Football data. This is a PostgreSQL database.

**INFORMATION BELOW IS PLACEHOLDER for formatting and structure**

## Dependencies
- [PostgreSQL](https://www.postgresql.org/download/)

## Installation
- Clone this repo: 
`git clone https://github.com/travboz/Celestial-Bodies-SQL-DB.git`.

- Navigate into the project directory: 
`cd celestial_bodies_project` (for example).

The commands used to build the database are contained in the `universe.sql` file. 

- Building the database
When in the folder containing the `universe.sql` file, run the following command to create and populate the database:
`psql -U postgres < universe.sql`

Using a program like [pgAdmin](https://www.pgadmin.org/download/) you can inspect the architecture of the database. Alternatively, you can use SQL queries to explore.

There exist five tables with each table containing related information pertaining to stars, planets, galaxies, spacecraft, and moons.

| Table Name  | Description                                                                                                           |
|-------------|-----------------------------------------------------------------------------------------------------------------------|
| `planet`      | Stores information about celestial bodies orbiting stars, including their names, physical characteristics, orbital periods, and the star they orbit. |
| `star`        | Contains data about stars, such as their names, types, distances from Earth, apparent magnitudes, and the galaxy they belong to. |
| `moon`        | Holds details about natural satellites orbiting planets, including their names, physical properties, orbital periods, and the planet they orbit. |
| `galaxy`      | Stores information about galaxies, including their names, types, stellar masses, average distances from Earth, and whether they are spiral galaxies. |
| `spacecraft`  | Contains data about spacecraft, including their names, missions, purposes, launch dates, and whether they are still in use. |

This project was created to follow the FreeCodeCamp certification project.

Project link: [Celestial Bodies Database](https://www.freecodecamp.org/learn/relational-database/build-a-celestial-bodies-database-project/build-a-celestial-bodies-database)
