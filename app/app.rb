module TwoSpoons
  class App < Padrino::Application

    register SassInitializer
    register Padrino::Rendering
    register Padrino::Mailer
    register Padrino::Helpers

    enable :sessions

    set :delivery_method, :smtp => {
      :address              => "mail.authsmtp.com",
      :port                 => 2525,
      :user_name            => ENV['AUTHSMTP_USERNAME'],
      :password             => ENV['AUTHSMTP_PASSWORD'],
      :authentication       => :cram_md5,
      :domain               => ENV['AUTHSMTP_DOMAIN'],
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
      disable :flash              # Disables rack-flash (enabled by default)
      # enable  :authentication     # Enable padrino-admin authentication (disabled by default)
      # layout  :my_layout          # Layout can be in views/layouts/foo.ext or views/foo.ext (default :application)

    end

    get "/" do
        render 'home/index'
    end

  end
end
