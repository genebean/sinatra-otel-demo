require './hello_world'

require 'opentelemetry-api'
require 'opentelemetry/exporters/jaeger'
require 'opentelemetry-instrumentation-sinatra'
require 'opentelemetry-sdk'


jaeger_host = ENV['JAEGER_HOST'] || 'localhost'
jaeger_port = ENV['JAEGER_PORT'] || 6831

OpenTelemetry::SDK.configure do |c|
  c.use 'OpenTelemetry::Instrumentation::Sinatra'

  c.add_span_processor(
    OpenTelemetry::SDK::Trace::Export::SimpleSpanProcessor.new(
      OpenTelemetry::Exporters::Jaeger::Exporter.new(
        service_name: 'sinatra-otel-demo', host: jaeger_host, port: jaeger_port
      )
    )
  )
end

run HelloWorld

