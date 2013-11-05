class GridShift
	def collect_tracks input, dim_size
		num_tracks = dim_size/2.0.ceil

		starting_x = 1
		starting_y = dim_size

		tracks = []
		num_tracks.times do |index|
			tracks << pull_track((starting_x + index), (starting_y - index), input)
			# input = input.select {|k,v| !new_track.keys.include? k }
			# tracks << new_track
		end	


		return tracks
	end

	def pull_track x_pos, y_pos, input
		input.select do |k,v|
			result = nil
			if v.include?(x_pos) || v.include?(y_pos)
				result = input[k] 
				input.delete k
			end
			result
		end
	end
end