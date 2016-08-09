# Be sure to restart your server when you modify this file.

Rails.application.config.session_store :cookie_store, key: '_SockapaloozaRails_session'

session = GoogleDrive::Session.from_config("config.json")
