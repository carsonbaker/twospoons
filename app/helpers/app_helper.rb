# Helper methods defined here can be accessed in any controller or view in the application

module TwoSpoons
  App.helpers do

    def kiss(short, long)
      content_tag(:div, short, :class => "d-block d-lg-none") +
      content_tag(:div, long, :class => "d-none d-lg-block")
    end

    def squish_layout(&block)
      content_tag("div", class: "col-5 col-sm-4 col-md-3 col-lg-3", &block)
    end

    def tight_layout(options, &block)
      options[:class] ||= ""
      options[:class] += " col-xl-6 col-lg-7 col-md-9 col-sm-10"
      content_tag("div", options, &block)
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
          <div class='col-4 mr-sm-1 mr-md-2'>
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

    def google_maps_javascript_script_tag
      key = "AIzaSyDkbW10yj6ZGacVyS8Bn79-64kdHgZc_6E"
      "<script src='https://maps.googleapis.com/maps/api/js?key=#{key}&callback=initMap' async defer></script>".html_safe
    end

    def initialize_google_map
      lat = "30.28"
      lon = "-97.75"
      zoom = 10
      safe_content_tag(:script) do
        "function initMap() {
          var map = new google.maps.Map(document.getElementById('map'), {
            scrollwheel: false,
            mapTypeControl: false,
            center: {lat: #{lat}, lng: #{lon}}, zoom: #{zoom}});
          };".html_safe
      end
    end

    def locations

      l = {}
      l << {:name => "Wellness Café at Victory Medical", :address => "4303 Victory Dr, Austin, TX 78704"}
      l << {:name => "Capitol Grill inside the Capitol", :address => "Capitol Building, Austin, TX"}
      l << {:name => "Hill Country Indoor", :address => "13875 Bee Caves Pkwy, Bee Caves, TX 78738"}
      l << {:name => "Houndstooth at Frost Tower", :address => "401 Congress Ave"}
      l << {:name => "Jo's Coffee, Doyle Cafe", :address => "St. Edwards University Campus"}
      l << {:name => "Jo's Coffee, Meadow's Cafe", :address => "St. Edwards University Campus"}
      l << {:name => "Juan Pelotta Café (inside Mellow Johnny's Bike Shop)", :address => "400 Nueces St, Austin, TX 78701"}
      l << {:name => "Riverside Chevron", :address => "400 S Congress Ave, Austin, TX 78704"}
      l << {:name => "Stouthaus Coffee Pub", :address => "4715 S Lamar Blvd #102, Sunset Valley, TX 78745"}
      l << {:name => "Stouthaus Coffee Pub", :address => "4715 S Lamar Blvd #102, Sunset Valley, TX 78745"}
      l << {:name => "The Coffee Bean & Tea Leaf #10", :address => "South Town  5030 W 290 Hwy, Bldg 11, Austin, TX 78735"}
      l << {:name => "The Coffee Bean & Tea Leaf #3", :address => "North Red River  1000 E 41st Street #100, Austin, TX 78751"}
      l << {:name => "The Coffee Bean & Tea Leaf #5", :address => "Galleria Oaks Shopping Center  13376 US-183, Austin, TX 78750"}
      l << {:name => "The Coffee Bean & Tea Leaf #7", :address => "Circle C 5701 W Slaughter Ln A170, Austin, TX 78749"}
      l << {:name => "The Coffee Bean & Tea Leaf #8", :address => "Steinter Ranch 5145 N FM 620, Austin, TX 78732"}
      l << {:name => "Thom's Market at Barton Springs", :address => "1418 Barton Springs Rd, Austin, TX 78704"}
      l << {:name => "Thom's Market at Riverside", :address => "160 E Riverside Dr, Austin, TX 78704"}

      return l
    end

  end
end
