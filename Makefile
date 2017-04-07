GEM_VERSION=$(shell cat tailstack.gemspec |grep s.version|tr -s [:space:]|cut -d ' ' -f 4|tr -d \')
all:
	gem install ./tailstack-${GEM_VERSION}.gem
release:
	gem build tailstack.gemspec
	gem push tailstack-${GEM_VERSION}.gem
clean:
	rm -f *.gem
