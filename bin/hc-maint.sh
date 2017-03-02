#!/bin/bash

cd /opt/healthchecks
/opt/healthchecks/manage.py prunepings
/opt/healthchecks/manage.py prunechecks
/opt/healthchecks/manage.py prunenotifications

