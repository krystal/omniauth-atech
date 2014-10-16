require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Codebase < Atech

      # Request access to the Codebase API
      option :authorize_params, {:scope => 'codebase'}

    end
  end
end
