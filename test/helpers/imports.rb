require 'watir-webdriver'
require 'test/unit'
require_relative '../pages/site'

BROWSER_TYPE = :firefox
URL_ROOT = 'http://show.websudoku.com/'
INTERACTIVE = true
S = Site.new

