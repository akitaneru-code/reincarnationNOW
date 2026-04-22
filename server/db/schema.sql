-- Users table
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  username VARCHAR(50) UNIQUE NOT NULL,
  email VARCHAR(100) UNIQUE NOT NULL,
  password_hash VARCHAR(255) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Languages table
CREATE TABLE languages (
  id SERIAL PRIMARY KEY,
  code VARCHAR(20) UNIQUE NOT NULL,
  name VARCHAR(100) NOT NULL,
  native_name VARCHAR(100),
  description TEXT
);

-- Lessons table
CREATE TABLE lessons (
  id SERIAL PRIMARY KEY,
  language_id INTEGER REFERENCES languages(id),
  title VARCHAR(200) NOT NULL,
  description TEXT,
  level VARCHAR(20),
  order_num INTEGER,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Vocabulary table
CREATE TABLE vocabulary (
  id SERIAL PRIMARY KEY,
  lesson_id INTEGER REFERENCES lessons(id),
  word VARCHAR(200) NOT NULL,
  translation VARCHAR(200) NOT NULL,
  pronunciation VARCHAR(300),
  example_sentence TEXT,
  difficulty VARCHAR(20),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- User progress table
CREATE TABLE user_progress (
  id SERIAL PRIMARY KEY,
  user_id INTEGER REFERENCES users(id),
  lesson_id INTEGER REFERENCES lessons(id),
  completed BOOLEAN DEFAULT FALSE,
  last_accessed TIMESTAMP,
  completion_percentage INTEGER DEFAULT 0
);

-- User vocabulary stats table
CREATE TABLE vocabulary_stats (
  id SERIAL PRIMARY KEY,
  user_id INTEGER REFERENCES users(id),
  vocabulary_id INTEGER REFERENCES vocabulary(id),
  times_seen INTEGER DEFAULT 0,
  times_correct INTEGER DEFAULT 0,
  last_reviewed TIMESTAMP,
  next_review TIMESTAMP
);
