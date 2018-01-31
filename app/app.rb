module Lipowoil
  class App < Padrino::Application


    register SassInitializer
    register Padrino::Rendering
    register Padrino::Mailer
    register Padrino::Helpers

    enable :sessions


    set :delivery_method, :smtp => {
      :address              => "mail.authsmtp.com",
      :port                 => 2525,
      :user_name            => '***REMOVED***',
      :password             => '***REMOVED***',
      :authentication       => :cram_md5,
      :domain               => '***REMOVED***',
      :enable_starttls_auto => true
    }

    configure do
      register SassInitializer

      ##
      # Application-specific configuration options
      #
      # set :raise_errors, true     # Show exceptions (default for development)
      # set :public, "foo/bar"      # Location for static assets (default root/public)
        set :sessions, false        # Enabled by default
      # set :reload, false          # Reload application files (default in development)
      # set :default_builder, "foo" # Set a custom form builder (default 'StandardFormBuilder')
      # set :locale_path, "bar"     # Set path for I18n translations (default your_app/locales)
      # disable :padrino_helpers    # Disables padrino markup helpers (enabled by default if present)
      # disable :padrino_mailer     # Disables padrino mailer (enabled by default if present)
      # disable :flash              # Disables rack-flash (enabled by default)
      # enable  :authentication     # Enable padrino-admin authentication (disabled by default)
      # layout  :my_layout          # Layout can be in views/layouts/foo.ext or views/foo.ext (default :application)

    end

    get "/" do
        render 'home/index'
    end

    get :about, :map => '/who-we-are' do
      @title = 'About'
      render 'home/who_we_are'
    end

    get :services, :map => '/services' do
      @title = 'Services'
      render 'home/services'
    end

    get :reports, :map => '/reports' do
      @title = 'Reports'
      render 'home/reports'
    end

    get :articles, :map => '/articles' do
      @title = 'Articles'
      render 'home/articles'
    end

    get :in_the_media, :map => '/in-the-media' do
      @title = 'In the Media'
      render 'home/in_the_media'
    end

    get :contact, :map => '/contact' do
      @title = 'Contact'
      render 'home/contact'
    end

    get :attributions, :map => '/attributions' do
      @title = 'Attributions'
      render 'home/attributions'
    end

    post '/contact' do
      msg = "#{params[:name]} <#{params[:email]} has sent you a message from your website:\n\n#{params[:message]}"

      if params[:false_name].empty? # spam bots will fill this fake parameter in
        email(
          :to => 'andy@lipowoil.com',
          :from => 'Carson Baker <carson@***REMOVED***>',
          :reply_to => "#{params[:name]} <#{params[:email]}>",
          :subject => 'Message from your website',
          :body    => msg,
        )
        @success = true

      end

      render 'home/contact'
    end

  end
end
