require_relative "lib/payfast/version"

Gem::Specification.new do |spec|
  spec.name           = "payfast_za"
  spec.version        = Payfast::VERSION
  spec.summary        = "Payments with Payfast for Ruby on Rails apps in South Africa"
  spec.authors        = ["Blessing Muchaya"]
  spec.email          = "btmuchaya@gmail.com"
  spec.homepage       = "https://github.com/muchaya/payfast_za"
  spec.license        = "MIT"
  spec.files          = Dir["{config,lib}/**/*"]

  spec.add_development_dependency "rails", ">= 6.0.0"
end
