class Array

  def deep_dup
    new_array = []
    self.each do |item|
      if item.is_a?(Array)
        new_array << item.deep_dup
      else
        new_array << item
      end
    end
    new_array
  end

end
