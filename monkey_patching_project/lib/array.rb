# Monkey-Patch Ruby's existing Array class to add your own custom methods
require 'byebug'
class Array
  def span
    span = 0
    if self.length == 0
        return nil
    elsif self.all? {|ele| ele.kind_of?(Numeric)}
        sorted = self.sort
        span = sorted[-1] - sorted[0]
    end
    return span
  end

  def average
    if self.length == 0
        return nil
    elsif self.all? {|ele| ele.kind_of?(Numeric)}
        (self.sum.to_f) / self.length
    end
  end

  def median
    if self.length == 0
        return nil
    elsif self.length.odd?
        sorted = self.sort
        index = (sorted.length - 1) / 2
        med = sorted[index]
        return med
    elsif self.length.even?
        sorted = self.sort
        first_index = (sorted.length / 2) - 1
        second_index = first_index + 1
        med = ((sorted[first_index] + sorted[second_index]) / 2.to_f)
        return med
    end
  end

  def counts
    count = Hash.new(0)
    self.each do |ele|
        count[ele] += 1
    end
    count
  end

  def my_count(val)
    count = self.counts
    return count[val]
  end

  def my_index(val)
    indices = Array.new
    self.each_with_index do |ele, i|
        if val == ele
            indices << i
        end
    end

    if indices.empty?
        return nil
    else
        return indices[0]
    end
  end

  def my_uniq
    unique_lo = Hash.new(0)
    self.each do |ele|
        unique_lo[ele] += 1
    end
    unique_lo.keys
  end

  def my_transpose
    # debugger
    n_rows = self.length - 1
    n_cols = self[0].length - 1
    transposed = Array.new(n_cols + 1) {Array.new(n_rows + 1, 0)}
    (0..n_rows).each do |row|
        (0..n_cols).each do |col|
            transposed[row][col] = self[col][row]
        end
    end
    transposed
  end








end
