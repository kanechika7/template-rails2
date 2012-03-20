# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_template-rails2_session',
  :secret      => '0822c6c899d27f0c3ffca9203415431dd5983c4891495a72434cefadb996840d3115cbc349dd3e8bd364acce2731131e55553d739a86454cc65875365563f56f'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
