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

  def item_owner?
    @item.user_id == current_user.id
  end

  def item_dataframe
    # @df = Daru::DataFrame.new([[get_keys], [get_values]])
    # @df = Daru::DataFrame.new([[1,2,3,4], [1,2,3,4]],order: [:a, :b], index: [:one, :two, :three, :four])
    @data_frame = Daru::DataFrame.from_csv('biostats.csv', liberal_parsing: true)
  end

  def get_keys
    total_keys = []
    @item.reviews.each do |review|
      review.properties.each_key do |k|
        total_keys << k
      end
    end
    total_keys
  end

  def get_values
    total = []
    @item.reviews.each do |review|
      review.properties.each_value do |v|
        total << v
      end
    end
    total
  end

end
