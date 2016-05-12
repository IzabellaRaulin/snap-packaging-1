require "spec_helper"

describe package("snap-telemetry") do
  it { should be_installed }
end

describe service("snapd") do
  it { should be_enabled }
  it { should be_running }
end

describe port(8181) do
  it { should be_listening }
end

describe command("snapd help") do
  its(:stdout) { should match /snapd - A powerful telemetry framework/ }
end

describe command("snapctl") do
  its(:stdout) { should match /snapctl - A powerful telemetry framework/ }
end
