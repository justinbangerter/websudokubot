class Cell
  #make sure to call 'read' after initializing

  def initialize(col,row,field, val=[], read_only=false)
    @col = col
    @row = row
    @field = field
    @val = val
    @read_only = read_only
  end

  def init
    read
    self
  end

  def val(val=nil)
    if val.nil?
      @val
    else
      @val = val
    end
  end

  def read
    #reads the cell value from the web page
    v = @field.attribute_value('value')
    if v.nil? or v == ''
      @val = *(1..9)
    else
      @val = [v.to_i]
      @read_only = true
    end
  end

  def write
    #writes the cell value to the web page
    @field.set(known? ? @val[0] : '') if INTERACTIVE && !@read_only
  end

  def col
    @col
  end

  def row
    @row
  end

  def seg
    #which segment contains this cell
    #top-left to bottom-right 0-8
    (@row/3).floor() * 3 + (@col/3).floor()
  end

  def empty?
    @val.size > 0
  end

  def known?
    @val.size == 1
  end
    
  def clone
    #the only reference to keep is to the driver
    c = Cell.new(@col,@row,@field,Array.new(@val),@read_only)
  end

  def label
    "f#{col}#{row}"
  end

end
