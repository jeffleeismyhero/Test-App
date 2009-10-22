# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_test_app_session',
  :secret      => 'd1b4d2be752258ae022ebd8a89e22eebdffdf1b3fc94c655201916f31195d8adaf76fa82753369a1d97201753159b2f16f44d1b19aaf58e6c52826037cef54d6'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
