class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :file

  version :thumb do
    process :crop
    resize_to_fill 80, 60
  end

  version :large do
    process :crop
    resize_to_fill 200, 200
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def default_url(*args)
    "/images/" + [version_name, "default.jpeg"].compact.join('_')
  end

  def extension_whitelist
     %w(jpg jpeg gif png)
  end

  private

    # Simplest way
    def crop
      return nil if !model.x
      manipulate! do |img|
        x = model.x
        y = model.y
        w = model.width
        h = model.height
        img.crop "#{w}x#{h}+#{x}+#{y}"
        img
      end
    end

end
