package mojominion;
use Mojo::Base 'Mojolicious', -signatures;

# This method will run once at server start
sub startup ($self) {

  # Load configuration from config file
  my $config = $self->plugin('NotYAMLConfig');

  # Configure the application
  $self->secrets($config->{secrets});

  $self->plugin(Minion => { SQLite => 'minionjobqueue.db'});

  # Router
  my $r = $self->routes;

  # Normal route to controller
  $r->get('/')->to('Example#welcome');
  $r->get('/addjob/slow')->to(controller => 'Example', action => 'addSlowJob');  # Route to add slow job
  $r->get('/addjob/high')->to(controller => 'Example', action => 'addHighJob');  # Route to add high priority job
  $self->plugin('Minion::Admin' => {route => $r->any('/admin')});  # Route to navigate to Minion Admin Console
}

1;
