require 'spec_helper'
require File.dirname(__FILE__) + '/../grid_shift'

describe GridShift do
	it 'should be setup' do
		GridShift.should == 2
	end
end