require 'spec_helper'
require File.dirname(__FILE__) + '/../grid_shift'

describe GridShift do

  let(:input) { {'A' => [1, 1], 'B' => [1, 2], 'C' => [1, 3], 'D' => [1, 4],
                 'E' => [2, 1], 'F' => [2, 2], 'G' => [2, 3], 'H' => [2, 4],
                 'I' => [3, 1], 'J' => [3, 2], 'K' => [3, 3], 'L' => [3, 4],
                 'M' => [4, 1], 'N' => [4, 2], 'O' => [4, 3], 'P' => [4, 4], } }

  let(:grid_shift) { GridShift.new }

  it 'should collect and shift tracks' do
    tracks = grid_shift.collect_and_shift_tracks input, 4
    tracks.size.should == 2
    tracks[0].should == {'E' => [1, 1], 'A' => [1, 2], 'B' => [1, 3], 'C' => [1, 4],
                         'I' => [2, 1],                               'D' => [2, 4],
                         'M' => [3, 1],                               'H' => [3, 4],
                         'N' => [4, 1], 'O' => [4, 2], 'P' => [4, 3], 'L' => [4, 4]}

    tracks[1].should == {'J' => [2, 2], 'F' => [2, 3], 'K' => [3, 2], 'G' => [3, 3]}
  end

end