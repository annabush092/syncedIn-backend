# syncedIn-backend

frontend: https://github.com/annabush092/SyncedIn-frontend

frameworks: Ruby on Rails api, postgres database


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
