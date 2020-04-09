-- one to one relationship

CREATE TABLE users (
    user_id SERIAL PRIMARY KEY, 
    first_name VARCHAR(30),
    last_name VARCHAR(30),
    email VARCHAR, 
    password VARCHAR(30)
);

CREATE TABLE passports (
    pass_id SERIAL PRIMARY KEY, 
    pass_number VARCHAR(16), 
    user_id INT REFERENCES users(user_id)
);

-- why would we want to keep these separate? it makes things more customizable. some people might not have a passport, so then we don't have to have an empty column on their row, so that makes things cleaner. it's more flexible. when might you want to put this kind of info on the same table? when your whole app centers around that. like, only if you needed it to all be on the same table.

INSERT INTO users (first_name, last_name, email, password)
VALUES ('jake', 'peralta', 'jp@b99.com', 'g4930ghjir'),
('amy', 'santiago', 'as@b99.com', '2940rav0behf'), 
('rosa', 'diaz', 'rd@b99.com', 't403qhr'),
('charles', 'boyle', 'cb@b99.com', 'g9r0ajrgv09fah'),
('gina', 'linetti', 'g@ghive.com', '0q34iefo');

INSERT INTO passports (pass_number, user_id)
VALUES ('BVDANF9409RAEJ34', 1), 
('JD7CUFIRL38XHDIE', 2), 
('S8RJAKC85HFUDY36', 3),
('86FEJ3LSIC6528GS', 4), 
('93NFGJD76SHWKFI8', 5);

-- how could we select the full names and passport numbers from these tables using a join? 

-- +++++++++++++++++++++++++ --
-- ========CODE HERE======== --
-- +++++++++++++++++++++++++ --



-- one-to-many relationship 
-- let's keep using our user table for our one-to-many example. an easy way to think of this is in the context of posts. one person can have many posts. but if you go to someone else's page, you're not going to see your own posts there. each user can have many posts. but posts don't have many users. 

CREATE TABLE posts (
    post_id SERIAL PRIMARY KEY, 
    content VARCHAR,
    user_id INT REFERENCES users(user_id)
);

INSERT INTO posts (content, user_id) 
VALUES ('Be myself, what kind of garbage advice is that?', 1),
('I''d like your eight dollar-est bottle of wine, please.', 1),
('What kind of woman doesn''t have an axe?', 3),
('The only thing I''m not good at is modesty, because I''m great at it.', 5),
('How was I supposed to know there''d be consequences for my actions?', 5);

-- how could we see all of the users posts? 

-- +++++++++++++++++++++++++ --
-- ========CODE HERE======== --
-- +++++++++++++++++++++++++ --


-- how could we see all the posts made by one user? 

-- +++++++++++++++++++++++++ --
-- ========CODE HERE======== --
-- +++++++++++++++++++++++++ --

-- many-to-many relationships 
-- one easy way to think of m-m relationships is like registration. let's say you have a bunch of students who are signing up for classes. no one student owns a class, and no one class owns a student. there are just relationships between lots of students and lots of classes. to keep with the brooklyn nine-nine theme, i'm going to use cases. detectives can have many open cases and cases can have many detectives assigned to them. we already have a user table, where our detectives are stored. now let's make a cases table. 

CREATE TABLE cases (
    case_id SERIAL PRIMARY KEY, 
    suspect VARCHAR, 
    crime VARCHAR
);

INSERT INTO cases (suspect, crime) 
VALUES ('jimmy figgis', 'arson'),
('doug judy', 'car theft'),
('seamus murphy', 'kidnapping'),
('melanie hawkins', 'embezzlement');

-- you probably noticed that there is not currently a relationship to the detectives. to do this, we will create a third table that will store the relationships for us. 

-- +++++++++++++++++++++++++ --
-- ========CODE HERE======== --
-- +++++++++++++++++++++++++ --

-- get all cases 

-- +++++++++++++++++++++++++ --
-- ========CODE HERE======== --
-- +++++++++++++++++++++++++ --


-- get one case's detectives

-- +++++++++++++++++++++++++ --
-- ========CODE HERE======== --
-- +++++++++++++++++++++++++ --


-- get one detective's cases

-- +++++++++++++++++++++++++ --
-- ========CODE HERE======== --
-- +++++++++++++++++++++++++ --
