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
