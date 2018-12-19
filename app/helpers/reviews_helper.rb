module ReviewsHelper

  def each_review_average
    review_total_value = []
    @review.properties.each do |k, v|
      review_total_value << v.to_i
    end
    review_total_value.sum / @review.properties.count
  end

end
