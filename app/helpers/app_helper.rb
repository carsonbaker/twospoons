# Helper methods defined here can be accessed in any controller or view in the application

module Lipowoil
  App.helpers do

    def link_to(name, url, options={})
       options[:href] = url
       options[:class] += ' active' if url == request.path_info
       "<a href='#{options[:href]}' class='#{options[:class]}'>#{name}</a>".html_safe
    end

    def squish_layout(&block)
      content_tag("div", class: "col-5 col-sm-4 col-md-3 col-lg-3", &block)
    end

    def tight_layout(&block)
      content_tag("div", class: "col-xl-6 col-lg-7 col-md-9 col-sm-10", &block)
    end

    def reg_layout(&block)
      content_tag("div", class: "col-xl-7 col-lg-8 col-md-10 col-sm-12", &block)
    end

    def wide_layout(&block)
      content_tag("div", class: "col-xl-9 col-lg-10 col-md-11 col-sm-12", &block)
    end

    def menu_item(name, img_path, desc)
      %(
        <div class='media'>
          <div class='col-4 mr-3'>
            #{image_tag img_path, :class => 'img-fluid rounded'}
          </div>
          <div class='media-body'>
            <h3>#{name}</h3>
            <p class='text-muted'>#{desc}</p>
          </div>
        </div>
        <br />
      ).html_safe
    end

  end
end
