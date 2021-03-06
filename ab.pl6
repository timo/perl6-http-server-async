#!/usr/bin/env perl6

use lib 'lib';
use HTTP::Server::Async;

my $s = HTTP::Server::Async.new;

#$*SCHEDULER = ThreadPoolScheduler.new(:max_threads(1000));

$s.register(sub ($req, $res, $next) {
  #"{$*SCHEDULER.loads}/{$*SCHEDULER.max_threads}".say;
  try {
    $res.headers<Content-Type> = 'text/plain';
    $res.status = 200;
    $res.write("Hello ");
    $res.close("world!");
    CATCH { .resume; }
  };
});

$s.listen;
'listen'.say;
$s.block;
