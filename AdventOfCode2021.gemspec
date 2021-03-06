
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "AdventOfCode2021/version"

Gem::Specification.new do |spec|
  spec.name          = "AdventOfCode2021"
  spec.version       = AdventOfCode2021::VERSION
  spec.authors       = ["Andre LaFleur"]
  spec.email         = ["andre.lafleur@techcyte.com"]

  spec.summary       = %q{Advent of Code 2021}
  spec.description   = %q{}
  spec.homepage      = "https://www.github.com/cincospenguinos/AdventOfCode2021"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = ""

    spec.metadata["homepage_uri"] = spec.homepage
    spec.metadata["source_code_uri"] = "https://www.github.com/cincospenguinos/AdventOfCode2021"
    spec.metadata["changelog_uri"] = "https://www.github.com/cincospenguinos/AdventOfCode2021"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.1"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency "pry", "~> 0.13.1"
end
