require 'spec_helper'
require File.dirname(__FILE__) + '/../grid_shift'

describe GridShift do

  let(:four_dim_input) {
    {'A' => [1, 1], 'B' => [1, 2], 'C' => [1, 3], 'D' => [1, 4],
     'E' => [2, 1], 'F' => [2, 2], 'G' => [2, 3], 'H' => [2, 4],
     'I' => [3, 1], 'J' => [3, 2], 'K' => [3, 3], 'L' => [3, 4],
     'M' => [4, 1], 'N' => [4, 2], 'O' => [4, 3], 'P' => [4, 4], }
  }

  let(:five_dim_input) {
    {'A' => [1, 1], 'B' => [1, 2], 'C' => [1, 3], 'D' => [1, 4], 'E' => [1, 5],
     'F' => [2, 1], 'G' => [2, 2], 'H' => [2, 3], 'I' => [2, 4], 'J' => [2, 5],
     'K' => [3, 1], 'L' => [3, 2], 'M' => [3, 3], 'N' => [3, 4], 'O' => [3, 5],
     'P' => [4, 1], 'Q' => [4, 2], 'R' => [4, 3], 'S' => [4, 4], 'T' => [4, 5],
     'U' => [5, 1], 'V' => [5, 2], 'W' => [5, 3], 'X' => [5, 4], 'Y' => [5, 5]}
  }

  let(:grid_shift) { GridShift.new }

  it 'should collect and shift tracks' do
    tracks = grid_shift.collect_and_shift_tracks four_dim_input, 4
    tracks.size.should == 2
    tracks[0].should == {'E' => [1, 1], 'A' => [1, 2], 'B' => [1, 3], 'C' => [1, 4],
                         'I' => [2, 1],                               'D' => [2, 4],
                         'M' => [3, 1],                               'H' => [3, 4],
                         'N' => [4, 1], 'O' => [4, 2], 'P' => [4, 3], 'L' => [4, 4]}

    tracks[1].should == {'J' => [2, 2], 'F' => [2, 3], 'K' => [3, 2], 'G' => [3, 3]}
  end

  it 'should collect and shift tracks for 3 tracks' do
    tracks = grid_shift.collect_and_shift_tracks five_dim_input, 5
    tracks.size.should == 3

    tracks[0].should ==  {'F' => [1, 1], 'A' => [1, 2], 'B' => [1, 3], 'C' => [1, 4], 'D' => [1, 5],
                          'K' => [2, 1],                                              'E' => [2, 5],
                          'P' => [3, 1],                                              'J' => [3, 5],
                          'U' => [4, 1],                                              'O' => [4, 5],
                          'V' => [5, 1], 'W' => [5, 2], 'X' => [5, 3], 'Y' => [5, 4], 'T' => [5, 5]}

    tracks[1].should == { 'L' => [2, 2], 'G' => [2, 3], 'H' => [2, 4],
                          'Q' => [3, 2],                'I' => [3, 4],
                          'R' => [4, 2], 'S' => [4, 3], 'N' => [4, 4],}

    tracks[2].should == { 'M' => [3, 3] }
  end

end