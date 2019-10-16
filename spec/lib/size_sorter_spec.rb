# frozen_string_literal: true

describe SizeSorter do
  let(:size_sorter) { described_class.new }

  describe '#sort_sizes' do
    subject { size_sorter.sort_sizes(data) }
    let(:data) { ['L', 'L/P', 'M', 'M/P', 'S', 'S/P', 'XL', 'XL/P', 'XS', 'XS/P'] }
    let(:result) { ['XS', 'S', 'M', 'L', 'XL', 'XS/P', 'S/P', 'M/P', 'L/P', 'XL/P'] }

    it { is_expected.to eq(result) }
    context do
      let(:data) { %w[L M S XL XS XXL XXS] }
      let(:result) { %w[XXS XS S M L XL XXL] }

      it { is_expected.to eq(result) }
    end
  end

  describe '#sort_number_sizes' do
    subject { size_sorter.sort_number_sizes(data) }
    let(:data) { %w[0 2 8 6 4 000 00] }
    let(:result) { %w[000 00 0 2 4 6 8] }

    it { is_expected.to eq(result) }
    context do
      let(:data) { %w[00 12 6 14 4 000 2 8 10 0] }
      let(:result) { %w[000 00 0 2 4 6 8 10 12 14] }

      it { is_expected.to eq(result) }
    end
  end

  describe '#sort_number_sizes_by_pattern' do
    subject { size_sorter.sort_number_sizes_by_pattern(data) }
    let(:data) { %w[0 2 8 6 4 000 00] }
    let(:result) { %w[000 00 0 2 4 6 8] }

    it { is_expected.to eq(result) }
    context do
      let(:data) { %w[00 12 6 14 4 000 2 8 10 0] }
      let(:result) { %w[000 00 0 2 4 6 8 10 12 14] }

      it { is_expected.to eq(result) }
    end
  end
end
