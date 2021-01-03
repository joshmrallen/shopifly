class User < ApplicationRecord
    validates :first_name, :last_name, presence: true
    validates :email, format: { with: /^(.+)@(.+)$/, message: "Email invalid" }, uniqueness: { case_sensitive: false }, length: { minimum: 4, maximum: 254 }, presence: true

    has_many_attached :images, service: :s3
    validates :image, content_type: [:png, :jpg, :jpeg]

    def full_name
        "#{first_name} #{last_name}"
    end

end
