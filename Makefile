GEM_VERSION=$(shell bin/tailstack --version)
all:
	gem install ./tailstack-${GEM_VERSION}.gem
release:
	gem build tailstack.gemspec
	gem push tailstack-${GEM_VERSION}.gem
clean:
	rm -f *.gem
