require './hello_world'

require 'opentelemetry-instrumentation-sinatra'
require 'opentelemetry/exporter/jaeger'
require 'opentelemetry/resource/detectors'
require 'opentelemetry/sdk'

jaeger_host = ENV.fetch('JAEGER_HOST', 'http://localhost:14268/api/traces')

OpenTelemetry::SDK.configure do |c|
  c.use 'OpenTelemetry::Instrumentation::Sinatra'
  c.add_span_processor(
    OpenTelemetry::SDK::Trace::Export::BatchSpanProcessor.new(
      exporter: OpenTelemetry::Exporter::Jaeger::CollectorExporter.new(endpoint: jaeger_host)
    )
  )
  c.service_name = 'sinatra-otel-demo'
  c.resource = OpenTelemetry::Resource::Detectors::AutoDetector.detect
end

run HelloWorld

