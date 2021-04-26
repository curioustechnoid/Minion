# Minion with Mojolicious

## Description

This has the complete source code of the demonstration done in:

[Blog on Minion](https://thecurioustechnoid.com/mojolicious-minion---a-high-performance-job-queue/)

[Video Tutorial](https://youtu.be/Icc9YOOF414)

## Commands

Start Worker: `./minion-worker.pl minion worker`

View Jobs: `./minion-worker.pl minion job`

Start Mojolicious Web App: `morbo mojominion/script/mojominion`

Admin Console: http://127.0.0.1:3000/admin

Adding Jobs to the Queue:

http://127.0.0.1:3000/addjob/slow

http://127.0.0.1:3000/addjob/high

Adding Jobs from Perl:

`./add-minion-job.pl slow`

`./add-minion-job.pl fast`


Adding Jobs from CLI:

`./minion-worker.pl minion job -e slow_task`
