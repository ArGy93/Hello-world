class RoundImageUploader < BaseImageUploader
  process :resize_to_fill => [600, 800]

  # Create different versions of your uploaded files:
  version :thumb do
    process resize_to_fit: [60, 80]
  end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_whitelist
    %w(jpg jpeg gif png)
  end

  def default_url(*args)
    "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  end
end
