GEM_VERSION=$(shell cat tailstack.gemspec |grep s.version|tr -s [:space:]|cut -d ' ' -f 4|tr -d \')
all:
	gem build tailstack.gemspec
install:
	gem install ./tailstack-${GEM_VERSION}.gem
push:
	gem push tailstack-${GEM_VERSION}.gem
