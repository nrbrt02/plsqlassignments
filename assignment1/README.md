# Artiste Project Management

The database is designed to store and manage information related to music artists, their albums, tracks, and personal details. It includes tables for storing artist information, album details, track information, and artist personal data. The database allows for tracking relationships between artists and their albums and tracks, as well as storing information about album and track release dates.

# SQL Commands Executed

This document provides a description of the SQL commands executed to create and manipulate a database for managing artists, albums, and tracks.

## 1. Create Tables

### Create Artist Table
```sql
CREATE TABLE artist(
    id int PRIMARY KEY, 
    stage_name VARCHAR(50)
);

*Purpose:* Creates a table named artist with an id as the primary key and a stage_name field.


CREATE TABLE artist_personal_data(
    id int PRIMARY KEY, 
    artist_id int, 
    names varchar(50), 
    place_of_birth varchar(50), 
    date_of_birth varchar(50), 
    FOREIGN KEY(artist_id) REFERENCES artist(id)
);
