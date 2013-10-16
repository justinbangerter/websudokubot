class Cells
  #facilitates usage of cell collections

  def initialize(cells)
    @cells = cells
  end

  def write
    @cells.each do |cell|
      cell.write
    end
  end

  def clear
    @cells.each do |cell|
      cell.clear
    end
  end

  def values
    @cells.map do |cell|
      cell.known? ? cell.val[0].to_i : '-'
    end
  end

  def labels
    @cells.map do |cell|
      cell.label
    end
  end

  def known_cells
    @cells.select do |cell|
      cell.known?
    end
  end

  def unknown_cells
    @cells.select do |cell|
      !cell.known?
    end
  end
  
  def dead_ends
    @cells.select do |cell|
      cell.val.size == 0
    end
  end

  def filter_possibilities(known)
    unknown_cells.each do |cell|
      cell.val.delete known.to_i
      cell.write if cell.known?
    end
    self
  end

  def valid?
    k = Cells.new(known_cells).values
    k.uniq == k && dead_ends.length == 0
  end

  def cells
    @cells
  end

end
