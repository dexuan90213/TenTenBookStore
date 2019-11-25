module BookHelper
  def cover_image_tag(book, width: 800, height: 600, dummy_img: false)

    if dummy_img
      if book.cover_image.attached?
        image_tag book.cover_image.variant(resize_to_limit: [width, height])
      else
         image_tag "https://bulma.io/images/placeholders/1280x960.png"
      end
    else
      image_tag book.cover_image.variant(resize_to_limit: [width, height]) if book.cover_image.attached?
    end

    # private
    # def generate_cover_image(width, height)
    #   image_tag book.cover_image.variant(resize_to_limit: [width, height])
    # end
  end
end
