# Journaler API

## Overview

This is a Ruby on Rails JSON API for a front-end React project, Journaler. The
application is a daily Journaling Single Page Application built with React. Users can create journals/notes, have quick access to past journals, and edit/delete journals. Journal stats and metrics (coming soon) will allow users to search journals by keywords, themes, and add journals to a favorites list.

## Database Structure

The Rails backend JSON API uses a Postgres database and is deployed via Heroku.
Our React project interacts with this JSON API through get, post, and patch
requests.

Our database is structured with the following two models:

* Users

* Journals

All models have their own unique routes and are
rendered in JSON by the API.

## API Use

This API is public and the only thing that requires authorization is posting to
the user session in order to login. The rest of the information is accessible to
anyone who goes to a route on the following base url:
https://journaler-api.herokuapp.com/api/v1/.

This public accessibility is mirrored in our front-end application.
https://journaler.herokuapp.com
I specifically did not add cross-user journal access (a la a blog site), as I wanted a personal journaling site based on personal growth and development.
