# Support for Provisioning Student Records Scenarios

This directory holds a few scripts that set up a test data for the in-progress feature of Student Records.

Run `./records/provision.sh` to set yourself up. Script is idempotent.

Run `./records/provision.sh clean` to reset course definitions as they are created.

## Users created

- records (@example.com)
- records_one_no_cert (@example.com)
- records_one_excluded_cert (@example.com)
- records_one_cert (@example.com)
- records_unverified (@example.com)

All have the password `edx`.

Additionally, the default edx@example.com user is an instructor for all the created courses. So you'll get some "noise" on that account. But they aren't a part of any scenario. You can play with their enrollment to test things yourself manually.

## Scenarios tested

- Learner in 1 Program w/o any certs

- Learner in 1 Program w/o any certs (but a course run which is excluded does)

- Learner in 1 Program w/ certs

- Learner in 2+ Programs w/ certs

- Learner in a program with 1 cert but not all

- Learner in a program with all certs awarded

===

- A program with just 1 course

- A program with courses from 2 schools

- A program in inactive state

- A program in retired state

- A program in deleted state

- A program with a long name

===

- A catalog course with both a revoked-cert run and an awarded-cert run

- A catalog course with several non-awarded runs (failed class) and an awarded cert-run

- A catalog course with several runs with different grades/letters

- A catalog course with several runs with different titles

- A catalog course that has no active runs (all old runs)

- A catalog course that has all runs excluded

- A catalog course that is not graded

===

- A course run with a self-paced cert course (grade could change)

- A course run with a self-paced cert course (and grade has changed)

- A course run with a long title

- A course run with a white-listed cert

- A course run with a revoked cert

- A course run with a normal awarded cert

- A course run with a cert but is excluded from the program