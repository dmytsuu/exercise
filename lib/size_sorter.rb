# frozen_string_literal: true

class SizeSorter
  def sort_sizes(data)
    ['XXS', 'XS', 'S', 'M', 'L', 'XL', 'XXL', 'XS/P', 'S/P', 'M/P', 'L/P', 'XL/P'] & data
  end

  def sort_number_sizes(data)
    data.sort_by(&:length).reverse.sort_by(&:to_i)
  end

  def sort_number_sizes_by_pattern(data)
    %w[000 00 0 2 4 6 8 10 12 14] & data
  end
end
