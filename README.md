# Study Timer

## Table of Contents
1. [Overview](#Overview)
1. [Product Spec](#Product-Spec)
1. [Wireframes](#Wireframes)
2. [Schema](#Schema)

## Overview
### Description
Study Timer is an iOS application that helps people keep track of how long they want to study for.


### App Evaluation
[Evaluation of your app across the following attributes]
- **Category:** Productivity/Studying
- **Mobile:** Mobile allows students to move and study in multiple envionments 
- **Story:** Allows students to manage their study time and reach their educational goals.
- **Market:** High School through college students
- **Habit:** Will be used often for students who need help with time management
- **Scope:** Allow user to set a study timer and view their time remaining each study session.

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**

* A timer to show how much time is left for current study session
* Start/Stop timer, be able to set how long you want the timer to run
* Stop timer button stops timer and sets timer box to 0


**Optional Nice-to-have Stories**

* Tracker to show study history 
* Reminders (similar to to-do list)

### 2. Screen Archetypes

* Loading Screen
   * shows name/logo while loading up app before taken to home screen
* Home Screen
   * shows main function of app: start/stop timer and display how much time is on timer currently
* Settings screen that allows the user to customize timer settings
   * Somewhere in the home screen, there will be a widget that allows you to go to the settings screen whne the icon is clicked

### 3. Navigation

**Tab Navigation** (Tab to Screen)

* Default/Home Tab
* Tracking (optional)
* Reminders (optional)

**Flow Navigation** (Screen to Screen)

* Home Screen Includes a box that shows how much time is left. Under it, there are start timer / stop timer buttons
   * After clicking start timer, it takes you to set how long you want your timer with preset numbers or fill in your own number (segue & present modally)
   * After clicking set, will go back to home screen and start timer
* Settings screen that allows the user to customize timer settings
   * Somewhere in the home screen, there will be a widget that allows you to go to the settings screen whne the icon is clicked

## Wireframes
[Add picture of your hand sketched wireframes in this section]
<img src="YOUR_WIREFRAME_IMAGE_URL" width=600>

### [BONUS] Digital Wireframes & Mockups
- See Above

### [BONUS] Interactive Prototype

## Schema 
[This section will be completed in Unit 9]
### Models
[Add table of models]
### Networking
- [Add list of network requests by screen ]
- [Create basic snippets for each Parse network request]
- [OPTIONAL: List endpoints if using existing API such as Yelp]
