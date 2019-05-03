module ItemsHelper

  def array_of_review_properties_in_item
    array = []
    @item.reviews.each do |review|
      array << review.properties
    end
    array
  end

  def arr
    totals = array_of_review_properties_in_item.reduce({}) do |keys, values|
      keys.merge(values) { |_, a, b| a.to_i + b.to_i / values.count + 1  }
    end
  end

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

  def item_owner?
    @item.user_id == current_user.id
  end

  def get_keys
    total_keys = []
    @item.reviews.each do |review|
      review.properties.each_key do |k|
        total_keys << k
      end
    end
    total_keys.to_s.tr('"', '')
  end

  def get_value
    total = []
    @item.reviews.each do |review|
      review.properties.each_value do |v|
        total << v.tr('"', '')
      end
    end
    total
  end

  def reviews_from_all_items
    total = []
    sum = []
    @items.each do |item|
      item.reviews do |review|
        review.properties.each_value do |v|
          total << v.to_i

        end

      end
      return total
    end


  end

end
