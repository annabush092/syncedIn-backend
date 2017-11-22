# syncedIn-backend

frontend: https://github.com/annabush092/SyncedIn-frontend

frameworks: Ruby on Rails api, postgres database

*/
???:

Why can't I give a hash as an argument to my custom method? (user.add_skill({hash here???}))
Error is that Rails is looking for methods with the names of each key, so it errors when it doesn't find them. So do I have to use regular old arguments and just remember what they are? (annoying...)


TODO:

done  -  end of day Wednesday: create db, models, associations, start seeding
done - end of day Friday:
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
    instruments:
      name: string
      family_id: int
    families:
      name: string
    genres:
      name: string
    user-instruments:
      user_id: int
      instrument_id: int
    skills:
      user_instrument_id: int
      genre_id: int
      perform: boolean
      teach: boolean

  relationships:
    User:
      has_many: :user_contacts
      has_many: :contacts, through: :user_contacts
      has_many: user-instruments
      has_many: instruments, through: user-instruments
      has_many: skills, through: user-instruments
      has_many: genres, through: skills
    UserContacts:
      belongs_to: :user
      belongs_to: :contact, class: "User"
      NOTE: For a User to see all of its contacts, create 2 separate
        entries in this table, so both users can see the association with
        user.contacts. So if x adds y as a contact, you have 2 records:
        user_id: x.id, contact_id: y.id
        user_id: y.id, conatct_id: x.id
    Instrument:
      has_many: user-instruments
      has_many: users, through: user-instruments
      belongs_to: family
    Family:
      has_many: instruments
    Genre:
      has_many: skills
      has_many: user-instruments, through: skills
      has_many: users, through: user-instruments
    UserInstrument:
      belongs_to: user
      belongs_to: instrument
      has_many: skills
      has_many: genres, through: skills
    Skill:
      belongs_to: user-instrument
      belongs_to: genre

  Validations:
      User: username is required and unique
      Instrument: name is required and unique
      Family: name is required and unique
      Genre: name is required and unique
      UserContact: has no duplicate entries
      UserInstrument: has no duplicate entries
      Skill: has no duplicate entry of user_instrument_id + genre_id


To run:
rake db:create
rake db:migrate
rake db:seed


Random stretch goals:

Incorporate equipment- if someone plays the bass clarinet, do they have one? Especially important for percussion

Allow users to create new Genres. Before creating the genre, try to match it with something that already exists, and ask them to choose one or create a new one anyways. (Try to search for each individual word inside other genre names to see if there are any matches?)

Add a 'willing-to-learn' category for instruments and genres in a user profile
