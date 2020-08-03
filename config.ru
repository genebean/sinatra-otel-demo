require './hello_world'

require 'opentracing'
require 'ddtrace'
require 'ddtrace/opentracer'

# Activate the Datadog tracer for OpenTracing
OpenTracing.global_tracer = Datadog::OpenTracer::Tracer.new

Datadog.configure do |c|
  c.use :sinatra

  c.distributed_tracing.propagation_inject_style = [Datadog::Ext::DistributedTracing::PROPAGATION_STYLE_B3]
  c.distributed_tracing.propagation_extract_style = [Datadog::Ext::DistributedTracing::PROPAGATION_STYLE_B3]

  logger = Logger.new(STDOUT)
  # c.logger.level = ::Logger::INFO
  logger.formatter  = proc do |severity, datetime, progname, msg|
    "[#{datetime}][#{progname}][#{severity}][#{Datadog.tracer.active_correlation}] #{msg}\n"
  end
end

run HelloWorld

