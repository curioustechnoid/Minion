#!/usr/bin/env perl
#
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# minion-worker.pl
#
# AUTHOR:  Curious Technoid
# DATE:  20-Apr-2021
# VERSION:  1.0
# PURPOSE:
#           This mojo app is to initiate the minion worker
#           which will process the jobs in the queue.
#
# USAGE: 
#       ./minion-worker.pl minion worker -m production
#
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# 
use Mojolicious::Lite -signatures;


# Using sqlite for the queue
plugin Minion => { SQLite => 'minionjobqueue.db', };



#
# Dummy Slow Running Task
#
app->minion->add_task(slow_task => sub ($job) {

        my $id = $job->id;
        $job->app->log->info("Slow Running Task Initiated -> ".$id);
        sleep 20;
        $job->app->log->info("Slow Running Task Completed -> ".$id);
        $job->finish({message => "Slow Running Task Completed -> ".$id});
});

#
# Dummy High Priority Task
#
app->minion->add_task(high_priority => sub ($job) {

        my $id = $job->id;
        $job->app->log->info("High Priority Task Initiated -> ".$id);
        sleep 3;
        $job->app->log->info("High Priority Task Completed -> ".$id);
        $job->finish({message => "High Priority Task Completed -> ".$id});
});



app->start;
