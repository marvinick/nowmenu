module ReviewsHelper 

  def each_review_average
    total_value = []
    @review.properties.each do |k, v|
      total_value << v.to_i
    end
    total_value.sum / @review.properties.count
  end

end
