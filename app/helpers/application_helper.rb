module ApplicationHelper
    def link_to_add_categories(name, f, association)
        new_object = f.object.send(association).klass.new
        id = new_object.object_id
        fields = f.fields_for(association, new_object, child_index: id) do |builder|
            render(association.to_s.singularize + "_categories", f: builder)
        end
        link_to(name, '#', class: "add_fields", data: {id: id, fields: fields.gsub("\n", "")})
    end

    def each_review_average
      review_total_value = []
      @review.properties.each do |k, v|
        review_total_value << v.to_i
      end
      review_total_value.sum / @review.properties.count
    end

    def custom_bootstrap_flash
      flash_messages = []
      flash.each do |type, message|
        type = 'success' if type == 'notice'
        type = 'error'   if type == 'alert'
        text = "<script>toastr.#{type}('#{message}');</script>"
        flash_messages << text.html_safe if message
      end
      flash_messages.join("\n").html_safe
    end

    

end
