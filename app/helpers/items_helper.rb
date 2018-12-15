module ItemsHelper
  def each_item_review_average
    float = sum_review_average / @item.reviews.count
    float.floor
  end

  def sum_review_average
    total = []
    total_value = []
    sum_of_each_review_average = []
    @item.reviews.each do |review|
      review.properties.each do |k, v|
        total_value << v.to_i
      end
      return total_value.sum / review.properties.count
    end
  end
end
