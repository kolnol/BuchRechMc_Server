create table users (
  id int NOT NULL AUTO_INCREMENT,
  last_name varchar(255),
  first_name varchar(255),
  password varchar(255) NOT NULL,
  email varchar(255) NOT NULL,
  enabled TINYINT NOT NULL DEFAULT 0,
  token varchar(255) NOT NULL,
  UNIQUE KEY uni_email (email),
  PRIMARY KEY(id)
);

CREATE TABLE user_roles (
  user_role_id int(11) NOT NULL AUTO_INCREMENT,
  email varchar(45) NOT NULL,
  role varchar(45) NOT NULL,
  PRIMARY KEY (user_role_id),
  UNIQUE KEY uni_email_role (role,email),
  CONSTRAINT fk_username FOREIGN KEY (email) REFERENCES users(email)
);

create table topics (
  chapter int NOT NULL,
  topic varchar(255) NOT NULL,
  PRIMARY KEY(chapter)
);

create table questions (
  id int NOT NULL AUTO_INCREMENT,
  content varchar(1023),
  chapter int,
  hint varchar(511),
  correct_answer_id int,
  is_booking_entry TINYINT,
  from_page int NOT NULL,
  to_page int NOT NULL,
  PRIMARY KEY(id)
);

create table answers (
  id int NOT NULL AUTO_INCREMENT,
  question_id int NOT NULL,
  answer_id int NOT NULL,
  answer varchar(511),
  PRIMARY KEY (id),
  FOREIGN KEY (question_id) REFERENCES questions(id) ON DELETE CASCADE
);

create table users_questions (
  id int NOT NULL AUTO_INCREMENT,
  user_id int NOT NULL,
  question_id int NOT NULL,
  tried boolean,
  correctly_answered boolean,
  given_answer_id int,
  PRIMARY KEY (id),
  FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
  FOREIGN KEY (question_id) REFERENCES questions(id) ON DELETE CASCADE
);

create table lectures (
  id int NOT NULL AUTO_INCREMENT,
  name varchar(255),
  start_chapter int,
  end_chapter int,
  PRIMARY KEY(id)
);
