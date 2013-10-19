require_relative 'cell'
require_relative 'cells'


class Grid
  def initialize(browser)
    @browser = browser
  end

  def init_cells()
    @cells = (0..8).map do |col|
      (0..8).map do |row|
        wrap_cell(col,row).read
      end
    end
    self
  end

  def get(col,row)
    @cells[col][row]
  end

  def row(row)
    Cells.new(@cells.map do |col|
      col[row]
    end)
  end

  def col(col)
    Cells.new(@cells[col])
  end

  def seg(seg)
    x = (seg%3)*3
    y = ((seg/3).floor) * 3
    Cells.new((x...(x+3)).map do |col|
      (y...(y+3)).map do |row|
        get(col,row)
      end
    end.flatten)
  end

  def all_cells
    Cells.new(@cells.flatten)
  end

  def known_cells
    all_cells.known_cells
  end

  def unknown_cells
    all_cells.unknown_cells
  end

  def filter_possibilities
    #clear possibility arrays of known values
    known_cells.each do |cell|
      valid = true
      [col(cell.col), row(cell.row), seg(cell.seg)].each do |x|
        valid &= x.filter_possibilities(cell.val[0].to_i).valid?
      end
      return false if !valid
    end
  end

  def valid?
    (0..8).each do |x|
      [col(x), row(x), seg(x)].each do |y|
        return false if !y.valid?
      end
    end
    return true
  end

  def wrap_cell(col,row)
    Cell.new(col, row, @browser.text_field({:id => label(col,row)}))
  end

  def label(col,row)
    "f#{col}#{row}"
  end

  def print()
    puts
    print_rows(0..2)
    puts '-'*11
    print_rows(3..5)
    puts '-'*11
    print_rows(6..8)
    puts
  end

  def print_rows(range)
    range.each do |x|
      puts row(x).values.join.insert(6,'|').insert(3,'|')
    end
  end

  def clone
    cells = @cells.map do |col|
      col.map do |cell|
        cell.clone
      end
    end
    Grid.new(@browser).set_cells(cells)
  end

  def set_cells(cells)
    @cells = cells
    self
  end

end
