require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Atech < OmniAuth::Strategies::OAuth2

      # Set the site
      option :client_options, { :site => 'https://identity.atechmedia.com' }

      # Always request the 'email_address' when authenticating using Omniauth.
      option :authorize_params, { :scope => 'email_address' }
      option :authorize_options, [:prompt]

      # Set the UID
      uid { raw_info['identifier'].to_s }

      # Set the all the default info properties as best we can
      info do
        {
          'nickname' => raw_info['username'],
          'email' => email_address,
          'name' => "#{raw_info['name']['first']} #{raw_info['name']['last']}",
          'image' => raw_info['avatar_url'],
          'first_name' => raw_info['name']['first'],
          'last_name' => raw_info['name']['last'],
        }
      end

      # Provide access to the user's raw info
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

      # Return the user's first e-mail address
      def email_address
        raw_info['email_addresses'] && raw_info['email_addresses'].first
      end

    end
  end
end
