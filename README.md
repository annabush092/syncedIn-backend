# syncedIn-backend

frontend: https://github.com/annabush092/SyncedIn-frontend

frameworks: Ruby on Rails api, postgres database


Wireframe:
  See googledoc

Validations:
    User: username is required and unique
    Instrument: name is required and unique
    Family: name is required and unique
    Genre: name is required and unique
    Post: content is required
    Tag: tag_text is required and unique
    UserFollow: has no duplicate entries
    UserInstrument: has no duplicate entries
    PostTag: has no duplicate entries
    Skill: has no duplicate entry of user_instrument_id + genre_id


To run:
rake db:create
rake db:migrate
(rake db:seed)


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

Catch error in frontend if server is down and sends any response besides 200...

When a user follows another user, update both in the frontend (currently only the currentUser is updated in the frontend, even though both are updated in the backend- to see the full updates, you need to refresh the entire site)
