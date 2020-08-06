# Sinatra OTel Demo

This is a simple Sinatra application that sleeps a random amount of time before showing a page. It has tracing setup per via https://github.com/open-telemetry/opentelemetry-ruby/tree/master/instrumentation/sinatra and is using the Jaeger exporter from https://github.com/open-telemetry/opentelemetry-ruby/tree/master/exporters/jaeger.

A docker-compose file is included that starts up both.
