class ImageUploader < Admin::AttachmentUploader

  # Brb currently requires MiniMagick for Admin Versions
  include CarrierWave::MiniMagick
  # include CarrierWave::RMagick

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :c2, if: :image? do
    process quality: 90
    process resize_to_fit: [840, 2400]
  end

  version :c4, if: :image? do
    process quality: 90
    process resize_to_fit: [1680, 4800]
  end

  version :full_screen, if: :image? do
    process quality: 90
    process resize_to_fit: [1800, 5145]
  end

end
