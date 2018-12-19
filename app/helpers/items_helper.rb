module ItemsHelper

  def item_average_rating
    each_review_total_collection.sum / @item.reviews.count rescue 0
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

  def reviewers
    reviewers = []
    @item.reviews.each do |review|
      reviewers << review.user_id
    end
    reviewers.uniq
  end

end
