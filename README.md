# syncedIn-backend

frontend: https://github.com/annabush092/SyncedIn-frontend

frameworks: Ruby on Rails api, postgres database


*/
TODO:

end of day Wednesday: create db, models, associations
end of day Friday: seed db with:
  ~10 instruments + relevant families,
  ~3 genres,
  ~5 users,
  DETAILED associations (use family for inspiration)
end of day Saturday: basic API setup, enough front-end framework in place to test API
end of day Sunday: User profile/show pages (no formatting yet), User list and cards
end of day Monday: All user index/show in place, including filters for index

stretch goal for end of day Monday: basic login (no auth) and sign-up

/*

Wireframe:

  db:
    users:
      name: string
    contacts:
      user_id: int
      contact_id: int (class=User)
    user-instruments:
      user_id: int
      instrument_id: int
    instruments:
      name: string
      family_id: int
    families:
      name: string
    user-genres:
      user_instrument_id: int
      genre_id: int
      perform: boolean
      teach: boolean
    genres:
      name: string

  relationships:
    User:
      has_many: contacts
      has_many: user-instruments
      has_many: instruments, through: user-instruments
      has_many: user-genres, through: user-instruments
      has_many: genres, through: user-genres
    UserInstrument:
      belongs_to: user
      belongs_to: instrument
      has_many: user-genres
      has_many: genres, through: user-genres
    Instrument:
      has_many: user-instruments
      has_many: users, through: user-instruments
      belongs_to: family
    Family:
      has_many: instruments
    UserGenre:
      belongs_to: user-instrument
      belongs_to: genre
    Genre:
      has_many: user-genres
      has_many: user-instruments, through: user-genres
      has_many: users, through: user-instruments
