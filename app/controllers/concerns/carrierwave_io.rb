class CarrierwaveIO < StringIO
  def original_filename
    "image.jpeg"
  end
  def content_type
    "image/jpeg"
  end
end
