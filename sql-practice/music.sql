-- This ensures that SQLite enforces FOREIGN KEY constraints
PRAGMA foreign_keys = 1;
DROP TABLE IF EXISTS instruments;
DROP TABLE IF EXISTS musicians;
DROP TABLE IF EXISTS bands;

CREATE TABLE bands (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name VARCHAR(100)
);
CREATE TABLE musicians (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  first_name VARCHAR(100) NOT NULL,
  last_name VARCHAR(100),
  band_name VARCHAR(100),
  FOREIGN KEY (band_name) REFERENCES bands(name) ON DELETE CASCADE
);
CREATE TABLE instruments (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  type VARCHAR(100) NOT NULL,
  player VARCHAR(100) NOT NULL
);

SELECT musicians.band_name, instruments.player, instruments.type
FROM    instruments
JOIN    musicians
ON      instruments.player = musicians.first_name
