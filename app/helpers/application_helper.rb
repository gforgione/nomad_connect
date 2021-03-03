module ApplicationHelper
  def get_photo_key(object)
    if object.photo.attachment.present?
      photo_key = object.photo.key
    else
      photo_key = "https://res.cloudinary.com/ducqpxfso/image/upload/v1614708710/no-image-available_wakuuv.webp" #no photo image on cloudinary
    end 
 end
end
