if RUBY_VERSION < "1.9"
  require 'rubygems'
end
require 'awesome_print'
IRB.conf[:USE_READLINE] = true
AwesomePrint.irb!
