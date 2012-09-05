Dir["vendor/*/lib"].each { |path| $:.unshift path } 
require "./ootu"
run Ootu.new