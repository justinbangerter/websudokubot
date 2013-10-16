require_relative 'page'
require_relative '../helpers/grid'
require_relative '../helpers/cell'
require_relative '../helpers/cracker'

class Index < Page 
  def initialize(browser)
    super(browser, URL_ROOT+'?level=4')
    @browser = browser
  end

  def open(append='')
    super(append)
    self
  end

  def cracker
    Cracker.new(grid)
  end

  def grid
    Grid.new(@browser).init_cells
  end
end
