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

