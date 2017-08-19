module ApplicationHelper
	def bootstrap_class_for flash_type
    	{ success: "alert-success", error: "alert-danger", alert: "alert-warning", notice: "alert-info" }[flash_type.to_sym] || flash_type.to_s
  	end

	def flash_messages(opts = {})
    flash.each do |msg_type, message|
      concat(content_tag(:div, message, class: "text-center alert #{bootstrap_class_for(msg_type)} alert-dismissible", role: 'alert') {
               concat(content_tag(:button, class: 'close', data: { dismiss: 'alert' }) {
                        concat content_tag(:span, '&times;'.html_safe, 'aria-hidden' => true)
                        concat content_tag(:span, 'Close', class: 'sr-only')
               })
               concat message
      })
    end
    nil
  end

  def fetch_category

    categories = Category.all.collect{|category| [category.category_title.capitalize,category.id]}  
  
  end

end
