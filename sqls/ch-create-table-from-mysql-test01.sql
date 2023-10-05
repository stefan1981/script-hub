CREATE TABLE IF NOT EXISTS `test-full` (
  id UInt64,
  mystring String,
  mybool Boolean,
  mydatetime DateTime,
  mydate Date,
) ENGINE = MergeTree ORDER BY id;

INSERT INTO `test-full` (
  id,
  mystring,
  mybool,
  mydatetime,
  mydate
) VALUES (
  1,
  'teststring',
  0,
  now(),
  toDate(now())
);

-- CREATE DATABASE db1_mysql ENGINE = MaterializedMySQL('172.22.0.4:3306', 'db1', 'admin', 'Start12345+X123');
