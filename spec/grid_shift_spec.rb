require 'spec_helper'
require File.dirname(__FILE__) + '/../grid_shift'

describe GridShift do

	let(:input) { {'A' => [1,1], 'B' => [1,2], 'C' => [1,3], 'D' => [1,4],
					'E' => [2,1], 'F' => [2,2], 'G' => [2,3], 'H' => [2,4],
					'I' => [3,1], 'J' => [3,2], 'K' => [3,3], 'L' => [3,4],
					'M' => [4,1], 'N' => [4,2], 'O' => [4,3], 'P' => [4,4], } }

	let(:grid_shift) {GridShift.new}					
	it 'should collect tracks' do
		tracks = grid_shift.collect_tracks input, 4
		tracks.size.should == 2
		tracks[0].should ==  {'A' => [1,1], 'B' => [1,2], 'C' => [1,3], 'D' => [1,4],
					'E' => [2,1], 'H' => [2,4],
					'I' => [3,1], 'L' => [3,4],
					'M' => [4,1], 'N' => [4,2], 'O' => [4,3], 'P' => [4,4], }

		tracks[1].should == { 'F' => [2,2], 'G' => [2,3], 'J' => [3,2], 'K' => [3,3]}					
	end
end