# syncedIn-backend

frontend: https://github.com/annabush092/SyncedIn-frontend

frameworks: Ruby on Rails api, postgres database


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

Location of musicians!

Can users rank their instruments so the userCard shows the most important ones? (userCard shows perform=true instruments)

Allow musicians to upload a resume, what they're currently working on, past schools, bio, etc

Add pictures for each instrument and genre to display on profile instrument cards

Allow users to link to each other in posts (think of twitter- you can follow people or mention their name in a tweet to get their attention)

Allow users to directly message each other, but also give them the option to block direct messages

If I make updates to a user, how do I force the page to reload and show those changes without totally reloading the site?

Catch error in frontend if server is down and sends any response besides 200...
