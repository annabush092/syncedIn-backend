# syncedIn-backend

frontend: https://github.com/annabush092/SyncedIn-frontend

frameworks: Ruby on Rails api, postgres database

*/
MVP
TODO:

end of day Wednesday: create db, models, associations, start seeding
end of day Friday:
  seed db with:
    ~10 instruments + relevant families,
    ~3 genres,
    ~5 users,
    DETAILED associations so I have enough to test with and don't have to add
      anything extra to be able to work on front-end
  start controllers/routes
end of day Saturday:
  finish API, test with Postman
  Get Redux structure set up in front-end
end of day Sunday:
  UserProfile (detailed show pages),
  UserList and UserCard (basic info to display in list)
  no formatting yet
end of day Monday:
  filters for User list

stretch goals for end of day Monday:
  allow users to "friend" other users
  basic login (no auth) and sign-up forms
  allow users to edit their profile - think of a good way to approach this

/*

Wireframe:

  db:
    users:
      name: string
    user_contacts:
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
      has_many: :user_contacts
      has_many: :contacts, through: :user_contacts
      has_many: user-instruments
      has_many: instruments, through: user-instruments
      has_many: user-genres, through: user-instruments
      has_many: genres, through: user-genres
    UserContacts:
      belongs_to: :user
      belongs_to: :contact, class: "User"
      NOTE: For a User to see all of its contacts, create 2 separate
        entries in this table, so both users can see the association with
        user.contacts. So if x adds y as a contact, you have 2 records:
        user_id: x.id, contact_id: y.id
        user_id: y.id, conatct_id: x.id
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


To run:
rake db:create
rake db:migrate
