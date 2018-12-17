module ItemsHelper

  def item_average_rating
    each_review_total_collection.sum / @item.reviews.count
  end

  def each_review_total_collection
    all_total = []

    @item.reviews.each do |review|
      total = []
      review.properties.each_value do |v|
        total << v.to_i
      end
      all_total << total.sum / review.properties.count
    end
    all_total
  end

end
