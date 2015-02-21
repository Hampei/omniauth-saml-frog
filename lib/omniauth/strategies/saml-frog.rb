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
        inf[:first_name] ||= inf[:forename]
        inf[:last_name] ||= inf[:surname]
        inf[:email] ||= inf[:email_address]
        inf[:name]  ||= inf[:displayname] ||
                        "#{inf[:first_name]} #{inf[:last_name]}"
        inf
      end
    end
  end
end

OmniAuth.config.add_camelization 'saml_frog', 'SAMLFrog'
