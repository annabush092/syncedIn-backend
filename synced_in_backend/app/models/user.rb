class User < ApplicationRecord

  has_many :user_contacts
  has_many :contacts, through: :user_contacts

  has_many :user_instruments
  has_many :instruments, through: :user_instruments

  has_many :skills, through: :user_instruments
  has_many :genres, through: :skills

  validates :username, presence: true, uniqueness: true

  def add_contact(user)
    self.contacts << user
    user.contacts << self
    self.save
    user.save
  end

  def add_contacts(user_arr)
    user_arr.each do |user|
      self.add_contact(user)
    end
  end

  # props = { instrument: instance, genre: instance, teach: bool, perform: bool}
  def add_skill(props)
    assoc = UserInstrument.find_or_create_by(instrument_id: props[instrument].id, user_id: self.id)
    Skill.create(user_instrument_id: assoc.id, genre_id: props[genre].id, teach: props[teach], perform: props[perform] )
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
  end
  # Returns nested structure:
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

end
