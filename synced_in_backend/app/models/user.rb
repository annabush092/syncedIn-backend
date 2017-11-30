class User < ApplicationRecord

  has_secure_password

  has_many :following_users, class_name: "UserFollow", foreign_key: "following_id"
  has_many :followed_users, class_name: "UserFollow", foreign_key: "followed_id"
  has_many :followed, through: :following_users
  has_many :following, through: :followed_users

  has_many :user_instruments
  has_many :instruments, through: :user_instruments

  has_many :skills, through: :user_instruments
  has_many :genres, through: :skills

  has_many :posts
  # dependent: :destroy

  validates :username, presence: true, uniqueness: true

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  def add_skill(instrument, genre, teach, perform)
    assoc = UserInstrument.find_or_create_by(instrument_id: instrument.id, user_id: self.id)
    Skill.create(user_instrument_id: assoc.id, genre_id: genre.id, teach: teach, perform: perform )
  end

  def show_skills
    self.user_instruments.map do |user_inst|
      my_genres = user_inst.skills.map do |skill|
        { genre: skill.genre.name, perform: skill.perform, teach: skill.teach }
      end
      {
        instrument: user_inst.instrument.name,
        skills: my_genres
      }
    end
  end # Returns nested structure:
  # [
  #   {
  #     instrument: name,
  #     genres: [
  #       {genre: name, perform: bool, teach: bool},
  #       {genre: name, perform: bool, teach: bool}
  #     ]
  #   },
  #   {
  #     instrument: name,
  #     genres: [
  #       {genre: name, perform: bool, teach: bool},
  #       {genre: name, perform: bool, teach: bool}
  #     ]
  #   },
  # ]

  def users_i_am_following
    self.following.map do |followed|
      {id: followed.id, full_name: followed.full_name}
    end
  end

end
