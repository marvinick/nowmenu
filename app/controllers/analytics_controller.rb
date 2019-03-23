class AnalyticsController < ApplicationController

  def item_dataframe
    @df = Daru::DataFrame.new(a: get_keys, b: get_values)
  end

  def result
    item_dataframe
  end

  private

  def get_keys
    total_keys = []
    @item.reviews.each do |review|
      review.properties.each_key do |k|
        total_keys << k
      end
    end
  end

  def get_values
    total = []
    @item.reviews.each do |review|
      review.properties.each_value do |v|
        total << v
      end
    end
  end

  def set_project
    @project = Project.find(params[:id])
  end

  def set_item
    @item = @project.items.find(params[:item_id])
  end
end
