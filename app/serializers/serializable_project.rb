class SerializableProject < JSONAPI::Serializable::Resource
  type 'project'

  attributes :id, :title, :image, :tags, :description, :live,
             :source, :demo

  attribute :mobileImage do
    @object.mobile_image
  end
end
