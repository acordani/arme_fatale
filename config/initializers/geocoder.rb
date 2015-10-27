Geocoder.configure(
  lookup:    :google,
  api_key:   ENV['GOOGLE_API_KEY'],
  use_https: true,
  units:     :km,
  timeout:   15     # :km for kilometers or :mi for mile
)