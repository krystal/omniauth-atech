require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Deploy < Atech

      # Request access to the Codebase API
      option :authorize_params, {:scope => 'deploy'}

    end
  end
end
