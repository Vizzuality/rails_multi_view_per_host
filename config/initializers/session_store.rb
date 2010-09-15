# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_rails_multi_view_per_host_session',
  :secret      => 'e9739069f9973183dee0f5e751733370055c96d62e6352bcada205af4b20107367718f5108532f6edebd4a77c68f68bbee9dbd2a0b0be059cbc2133e6abc23d4'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
