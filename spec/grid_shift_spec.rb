require 'spec_helper'
require File.dirname(__FILE__) + '/../grid_shift'

describe GridShift do

  let(:four_dim_input) {
    [['A', 'B', 'C', 'D'],
     ['E', 'F', 'G', 'H'],
     ['I', 'J', 'K', 'L'],
     ['M', 'N', 'O', 'P']]
  }

  let(:five_dim_input) {
    [['A', 'B', 'C', 'D', 'E'],
     ['F', 'G', 'H', 'I', 'J'],
     ['K', 'L', 'M', 'N', 'O'],
     ['P', 'Q', 'R', 'S', 'T'],
     ['U', 'V', 'W', 'X', 'Y']]
  }

  let(:grid_shift) { GridShift.new }

  it 'should collect and shift tracks' do
    result = grid_shift.collect_and_shift_tracks four_dim_input, 4
    result.should == [['E', 'A', 'B', 'C'],
                      ['I', 'J', 'F', 'D'],
                      ['M', 'K', 'G', 'H'],
                      ['N', 'O', 'P', 'L']]
  end

  it 'should collect and shift tracks for 3 tracks' do
    result = grid_shift.collect_and_shift_tracks five_dim_input, 5

    result.should == [['F', 'A', 'B', 'C', 'D'],
                      ['K', 'L', 'G', 'H', 'E'],
                      ['P', 'Q', 'M', 'I', 'J'],
                      ['U', 'R', 'S', 'N', 'O'],
                      ['V', 'W', 'X', 'Y', 'T']]

  end

end