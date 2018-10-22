#!/bin/sh
psql -h $DB_HOST -c "select * from foo" -U postgres -w postgres blah_db
