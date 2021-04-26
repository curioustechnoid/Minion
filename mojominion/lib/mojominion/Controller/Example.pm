package mojominion::Controller::Example;
use Mojo::Base 'Mojolicious::Controller', -signatures;

# This action will render a template
sub welcome ($self) {

  # Render template "example/welcome.html.ep" with message
  $self->render(msg => 'Welcome to the Mojolicious real-time web framework!');
}


# Subroutine to add slow jobs
sub addSlowJob ($self) {

   my $jobid = $self->minion->enqueue(slow_task => []);

  $self->render(text => 'Your Slow Task is Added to the queue, Job ID: '.$jobid.'. <a href="/admin">Click here</a> to view the status.');
}



# Subroutine to add high priority jobs
sub addHighJob ($self) {

   #
   # By default priority is set to 0, anything more than that gets priority.
   # You can have values between -100 to 100
   #
   my $jobid = $self->minion->enqueue(high_priority => [] => {priority => 10});
   # my $jobid = $self->minion->enqueue(slow_task => []); #Another way of adding the task to the job queue

   $self->render(text => 'Your Task is Added to the high priority lane, Job ID: '.$jobid.'. <a href="/admin">Click here</a> to view the status.');

}

1;
