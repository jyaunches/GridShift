class GridShift
  def collect_and_shift_tracks(input, dim_size)
    num_tracks = (dim_size/2.0).ceil

    starting_x = 1
    starting_y = dim_size

    result = {}
    num_tracks.times do |index|
      track_min_dimension = (starting_x + index)
      track_max_dimension = (starting_y - index)
      new_track = pull_track(track_min_dimension, track_max_dimension, input)
      result.merge! shift_track(new_track, track_min_dimension, track_max_dimension)
    end
    result
  end

  private

  def shift_track(track, min_dim, max_dim)
    track.each do |k, v|
      x_pos = 0
      y_pos = 1

      x_value = v[x_pos]
      y_value = v[y_pos]

      if x_value == min_dim && y_value != max_dim
        v[y_pos] += 1
      elsif y_value == max_dim && x_value != max_dim
        v[x_pos] += 1
      elsif x_value == max_dim && y_value != min_dim
        v[y_pos] -= 1
      elsif y_value == min_dim && x_value != min_dim
        v[x_pos] -= 1
      end

    end
  end

  def pull_track(x_pos, y_pos, input)
    input.select do |k, v|
      result = nil
      if v.include?(x_pos) || v.include?(y_pos)
        result = input[k]
        input.delete k
      end
      result
    end
  end
end