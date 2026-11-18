ALTER SESSION SET NLS_DATE_FORMAT = 'DD-MM-YYYY'

CREATE TABLE  person (
	personID 		NUMBER(10),           
	lastName 		VARCHAR(50) NOT NULL,
	firstName 		VARCHAR(50) NOT NULL,
	birthDate 		DATE 		NOT NULL,
	deathDate 		DATE,
	gender 			CHAR(2)		CHECK(gender IN ('MA', 'FE', 'NB')),
CONSTRAINT person_pk PRIMARY KEY(personID)
);


CREATE TABLE productionCompany (
	companyName 	VARCHAR(100)  	NOT NULL,
	country 		VARCHAR(50) 	NOT NULL,
	foundationYear	NUMBER(4),	 
	founder			NUMBER(10)	NOT NULL,
CONSTRAINT company_pk PRIMARY KEY(companyName, country),
CONSTRAINT person_company_fk FOREIGN KEY(founder) REFERENCES person(personID)
);

CREATE TABLE producedBy (
	proMovieId	 	NUMBER(10) 	    NOT NULL,
	cName 		    VARCHAR(100) 	NOT NULL,
	cCountry		VARCHAR(50)		NOT NULL,	 
CONSTRAINT producedBy_pk PRIMARY KEY(proMovieId, cName, cCountry),
CONSTRAINT produced_movie_fk FOREIGN KEY(proMovieId) REFERENCES movie(movieID),
CONSTRAINT produced_company_fk FOREIGN KEY(cName, cCountry) REFERENCES productionCompany(companyName, country)
);


CREATE TABLE movie (
   movieId       NUMBER(10),
   releaseYear   NUMBER(4)    	NOT  NULL,
   title         VARCHAR(100)  	NOT NULL,
   duration      NUMBER(3)    	NOT NULL,
   budget        NUMBER(12,2),
   revenue       NUMBER(12,2),
   votes         NUMBER(5),
   votesAvg      NUMBER(2,1),
   sequelOf      NUMBER(10),
   CONSTRAINT movie_pk PRIMARY KEY(MovieId),
   CONSTRAINT movie_sequel_fk FOREIGN KEY(SequelOf) REFERENCES movie(movieId)
);
   
CREATE TABLE role(
   title         VARCHAR(40)  NOT NULL,
   description   VARCHAR(500) NOT NULL,
   type          VARCHAR(40)  NOT NULL CHECK(type IN ('ΚΑΛΟΣ', 'ΚΑΚΟΣ', 'ΟΥΔΕΤΕΡΟΣ')),
CONSTRAINT 	role_pk PRIMARY KEY(Title)
);
   
CREATE TABLE keywords(
   KeyMovieId   NUMBER(10)  NOT NULL,
   keyword      VARCHAR(30) NOT NULL,
CONSTRAINT 	keywords_pk PRIMARY KEY(KeyMovieId, Keyword)
);

CREATE TABLE actsIn(
  actsPersonId  NUMBER(10) NOT NULL,
  actsRole      VARCHAR(40) NOT NULL,
  actsMovieId   NUMBER(10)  NOT NULL,  
  CONSTRAINT actsIn_pk PRIMARY KEY(actsPersonId, actsRole, actsMovieId),
  CONSTRAINT actsin_person_fk FOREIGN KEY(actsPersonId) REFERENCES person(personID),
  CONSTRAINT actsin_role_fk FOREIGN KEY (actsRole) REFERENCES role(title),
  CONSTRAINT actsin_movie_fk FOREIGN KEY (actsMovieId) REFERENCES movie(movieId)
);

CREATE TABLE directedBy(
  dirPersonId  NUMBER(10) NOT NULL,
  dirMovieId   NUMBER(10) NOT NULL,
  CONSTRAINT directedBy_pk PRIMARY KEY (dirPersonId, dirMovieId),
  CONSTRAINT directed_person_fk FOREIGN KEY (dirPersonId) REFERENCES person(personId),
  CONSTRAINT directed_movie_fk FOREIGN KEY (dirMovieId) REFERENCES movie(movieId)
);
  
CREATE TABLE professions(
  profPersonId  NUMBER(10) NOT NULL,
  profession   VARCHAR(50) NOT NULL,
  CONSTRAINT professions_pk PRIMARY KEY (profPersonId, profession),
  CONSTRAINT professions_person_fk  FOREIGN KEY (profPersonId) REFERENCES person(personId)
);

CREATE TABLE genres(
    genMovieId NUMBER(10) NOT NULL,
    genre      VARCHAR(50) NOT NULL,
    CONSTRAINT genres_pk PRIMARY KEY (genMovieId, genre),
    CONSTRAINT penres_movie_fk FOREIGN KEY (genMovieId) REFERENCES movie(movieId)
);







