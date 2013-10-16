require_relative '../helpers/imports'

class TestParsing < Test::Unit::TestCase

  def test_000
    S.open
    S.home.open
  end

  def test_100_print_values
    S.home.grid.print
  end

  def test_400_seg_labels
    b = S.home.grid
    assert(b.seg(0).labels.include? "f00")
    assert(b.seg(1).labels.include? "f30")
    assert(b.seg(2).labels.include? "f60")
    assert(b.seg(3).labels.include? "f03")
    assert(b.seg(4).labels.include? "f33")
    assert(b.seg(5).labels.include? "f63")
    assert(b.seg(6).labels.include? "f06")
    assert(b.seg(7).labels.include? "f36")
    assert(b.seg(8).labels.include? "f66")
  end

  def test_600_seg_cells
    assert(Cell.new(0,0,nil).seg,'0')
    assert(Cell.new(3,0,nil).seg,'1')
    assert(Cell.new(6,0,nil).seg,'2')
    assert(Cell.new(0,3,nil).seg,'3')
    assert(Cell.new(3,3,nil).seg,'4')
    assert(Cell.new(0,5,nil).seg,'3')
  end

  def test_800_crack_board
    puts
    S.home.cracker.crack.print
  end
end
