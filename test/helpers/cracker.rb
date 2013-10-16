class Cracker

  def initialize(grid)
    @grid = grid
  end

  #crack the given board
  def crack(grid=@grid)
    grid = grid.clone

    #make sure the unknowns are wiped
    grid.unknown_cells.clear

    # use logic to reduce possibilities
    (1..9).each do |x|
      return nil if !grid.filter_possibilities
    end

    #return grid if all known
    return grid if grid.unknown_cells.empty?

    #make a guess
    unknown = grid.unknown_cells[0]
    unknown.val.clone.each do |guess|
      unknown.val([guess])

      #if this is a valid guess use it and recur
      if grid.valid?
        puts "f#{unknown.col}#{unknown.row} ?= #{guess}"
        unknown.write
        cracked = self.crack(grid)

        if !cracked.nil? then
          return cracked #successful guess
        end
      end
    end
    return nil
  end
end
