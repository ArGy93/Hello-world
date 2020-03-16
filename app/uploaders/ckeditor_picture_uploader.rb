# frozen_string_literal: true

class CkeditorPictureUploader < BaseImageUploader
  include Ckeditor::Backend::CarrierWave

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/ckeditor/pictures/#{model.id}"
  end

  [:extract_size].each do |method|
    define_method :"#{method}_with_cloudinary" do
      send(:"#{method}_without_cloudinary") if self.file.is_a?(CarrierWave::SanitizedFile)
      {}
    end
    alias_method :"#{method}_without_cloudinary", method
    alias_method method, :"#{method}_with_cloudinary"
  end

  # Create different versions of your uploaded files:
  version :thumb do
    process resize_to_fill: [118, 100]
  end

  version :content do
    process resize_to_limit: [800, 800]
  end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_white_list
    Ckeditor.image_file_types
  end
end
