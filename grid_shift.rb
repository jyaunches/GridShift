class GridShift
  def collect_and_shift_tracks input, dim_size
    num_tracks = (dim_size/2.0).ceil

    shifted_result = []
    dim_size.times { |i| shifted_result << [] }

    num_tracks.times do |track|
      starting_low = track
      starting_high = dim_size - 1 - track

      num_items_shifting = starting_high - starting_low

      num_items_shifting.times do |index|
        #top row
        shifted_result[starting_low][index + track +1] = input[starting_low][index + track]

        #right side
        shifted_result[index + track +1][starting_high] = input[index + track][starting_high]

        #bottom
        shifted_result[starting_high][index + track] = input[starting_high][index  + track + 1]

        #left side
        shifted_result[index + track][starting_low] = input[index  + track + 1][starting_low]
      end

      if num_items_shifting == 0
        lone_item = input[starting_high][starting_low]
        shifted_result[starting_high][starting_low] = lone_item
      end
    end
    shifted_result
  end

end