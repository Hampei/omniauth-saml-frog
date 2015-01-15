require 'omniauth-saml'

module OmniAuth
  module Strategies
    class SAMLFrog < SAML

      option :name, "saml_frog"

      info do
        inf = {}
        @attributes.each do |k,v|
          inf[k.tr(' ', '_').downcase.to_sym] = v[0]
        end
        inf[:email] = inf[:email_address]
        inf[:name]  = inf[:display_name] ||
                      "#{inf[:first_name]} #{inf[:last_name]}"
        inf
      end
    end
  end
end

OmniAuth.config.add_camelization 'saml_frog', 'SAMLFrog'
