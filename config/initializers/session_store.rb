# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_lw_pago_certo_uso_session',
  :secret      => '67780223eb0116b3515a98a19ecb0a90f411ab8dc651b46a90e19d51119115bc853b3dd34be4a94b753f63fe0c22d104e2812432ca1ca222a2f7684895a1698b'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
