# Monk
Submission for silicon valley hacks 2020

## Introduction
During this pandemic, many elderly people of the society are left at home struggling to support themselves, at great risk to go outside and get essential supplies such as medicine and groceries. However, there are a number of kind-hearted young people eager to volunteer to help them, but have no way of contacting or finding them - until now. Monk is a platform that focuses on the wellbeing of senior citizens during this health crisis, and also helps combat mental health issues related to loneliness during this crisis.

## What it does
We created an iOS app which allows the the elderly to find volunteers to help them, and allows the volunteers to find senior citizens they can help. They can send requests, which after being accepted, create a connection between the two users and allows them to communicate in-app. 
There are five major screens: 
### Find
This allows a volunteer to find a person that they will assist, or allows a senior citizen to find volunteers to help them.
### Notifications
This allows you to manage requests sent to you and sent by you using our API.
### Manage
This allows you to see all the people associated with you - if you're a volunteer, all the senior citizens that you're helping, and if you're a senior citizen, all the volunteers helping you
### Chabot
The chatbot is designed to converse with the user. If they detect signs of loneliness, the chatbot will assure the user that they're not alone and will always have someone with them.
Note: We built a fully functioning Python chatbot using Tensorflow. This chatbot is included in our github repository. However, due to last minute technical glitches, the chatbot could not be integrated into the iOS app, as a result of which we had to program static responses in the app for now. We hope to find a solution and integrate the chatbot into the app in the future

### Settings 
This allows the user to edit their profile and sign out of the app


## How We Built It
The iOS app was built using Swift and SwiftUI. The chatbot was built using Python and Tensorflow.
We set up the backend, which stores the user details and requests, using a REST API. We also used Firebase for authentication and storing user details. 
Note: Although we have set up the REST API, we felt that due to there not being enough users, for now, for demo purposes, we have added demo data to the app. The API was ready, but we have not integrated it into the app.

## Challenges we ran into
We faced a significant number of challenges during the development of Monk. First, we struggled to integrate the API into the app. Furthermore, we spent an extensive amount of time trying to integrate the highly advanced chatbot into the app, but were unable to.

## Accomplishments that we're proud of
We're proud of the fact that we were able to add such extended and diverse functionality to the app. Working across timezones was also an issue that we faced during development, but were able to overcome it.

## What's next for Monk
First, we plan on extending our user base and launching Monk internationally. We also want to develop an Android app to make our product reach more people. Furthermore, we want to work on integrating the fully functioning chatbot into the app. 
