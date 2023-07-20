create database github_db

use github_db

CREATE TABLE Owners (
  id_owner int ,
  name_o  VARCHAR(500) ,
  PRIMARY KEY (id_owner)
);



CREATE TABLE Langage (
  id_langage int ,
  langage  varchar(500),
  PRIMARY KEY (id_langage)
);

CREATE TABLE Repo (
  id_repo int ,
  name_repo varchar(500),
  url TEXT,
  description TEXT,
  stars int,
  created_at date,
  forks int,
  watchers int,
  open_issues int,
  contributors_count int,
  id_langage int,
  id_owner int,
  PRIMARY KEY (id_repo),
  CONSTRAINT FK_Repo_id_owner
    FOREIGN KEY (id_owner)
      REFERENCES Owners(id_owner),
  CONSTRAINT FK_Repo_id_langage
    FOREIGN KEY (id_langage)
      REFERENCES Langage(id_langage)
);

CREATE TABLE Contributors (
  id_Contributors int,
  name_Contributors  varchar(500),
  PRIMARY KEY (id_Contributors)
);


CREATE TABLE Contributors_repo (

 id_Contributor int Foreign Key References Contributors(id_Contributors),
    id_Repo int Foreign Key References Repo(id_repo),
    contribution_count int,
    Primary Key (id_Contributor,id_Repo)
);


select * from Owner;
select * from Langage;
select * from Repo;
select * from Contributors;
select * from Contributors_repo;


SELECT contribution_count
FROM Contributors_repo
WHERE id_repo = <id de la repo> AND id_Contributors = <id du contributeur>;

SELECT Contributors.name_Contributors, Contributors_repo.contribution_count
FROM Contributors_repo
JOIN Contributors ON Contributors.id_Contributors = Contributors_repo.id_Contributors
WHERE Contributors_repo.id_repo = 1 AND Contributors_repo.id_Contributors = 1;



