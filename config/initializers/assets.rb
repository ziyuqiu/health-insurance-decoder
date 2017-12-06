# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
# Rails.application.config.assets.precompile += %w( admin.js admin.css )
Rails.application.config.assets.precompile += %w( slider.js)
Rails.application.config.assets.precompile += %w( default_prof_pic.png)
Rails.application.config.assets.precompile += %w( light-veneer.png)
Rails.application.config.assets.precompile += %w(white_plaster.png)
Rails.application.config.assets.precompile += %w( pink_rice.png)
Rails.application.config.assets.precompile += %w( pain_chart.gif)
Rails.application.config.assets.precompile += %w( clinic_lst.js )
Rails.application.config.assets.precompile += %w( geolocation.js )
Rails.application.config.assets.precompile += %w( resources.js )
Rails.application.config.assets.precompile += %w( log_index.js )
