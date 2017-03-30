Gem::Specification.new do |s|
  s.name        = 'tailstack'
  s.version     = '0.0.5'
  s.executables << 'tailstack'
  s.summary     = "Tails the event output of AWS CloudFormation stacks"
  s.description = "aws sdk based tool for watching CloudFormation stacks being created, updated, or deleted."
  s.authors     = ["Tony Fruzza"]
  s.email       = 'anthony.fruzza@sturdynetworks.com'
  s.files       = ["bin/tailstack"]
  s.add_runtime_dependency 'aws-sdk', '~> 2.8'
  s.licenses    = ['MIT']
  s.homepage    = "https://github.com/tonyfruzza/tailstack"
end
