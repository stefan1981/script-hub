DROP TABLE IF EXISTS `test-full`;

CREATE TABLE IF NOT EXISTS `test-full` (
  id UInt64,
  mystring String,
  mybool Boolean,
  mydatetime DateTime,
  mydate Date,
) ENGINE = MergeTree ORDER BY id;

