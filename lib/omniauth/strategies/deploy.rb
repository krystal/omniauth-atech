require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Deploy < OmniAuth::Strategies::OAuth2
      # Each authorization must contain user_profile
      DEFAULT_SCOPE = 'user_profile'.freeze

      option :client_options, { site: 'http://deploy.localhost' }

      # Request access to the DeployHQ API
      option :authorize_options, [:scope, :prompt]

      uid { raw_info['identifier'] }

      info do
        {
          'name' => "#{raw_info['first_name']} #{raw_info['last_name']}",
          'first_name' => raw_info['first_name'],
          'last_name' => raw_info['last_name'],
          'email' => raw_info['email_address'],
          'time_zone' => raw_info['time_zone']
        }
      end

      extra do
        { 'raw_info' => raw_info }
      end

      # Set the callback URL
      def callback_url
        full_host + script_name + callback_path
      end

      # Return all the raw information for the user
      def raw_info
        @raw_info ||= begin
          access_token.options[:mode] = :query
          access_token.options[:param_name] = 'oauth_token'
          access_token.get('oauth/api/profile').parsed
        end
      end

      def authorize_params
        super.tap do |params|
          options[:authorize_params].each do |option|
            params[option] = request.params[option.to_s] if request.params[option.to_s]
          end

          params[:scope] = "#{DEFAULT_SCOPE}, #{params[:scope]}"
        end
      end
    end
  end
end

