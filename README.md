# Progress Tracker

As a former English teacher, I often wished for a tool that allowed students to reflect on and record their progress through  course standards. This would not only allow them to take more ownership of their learning, but also see their growth over time.  Additionally, standards-based grading and assessment is replacing traditional letter grading in many schools, so this tool could be beneficial in helping students and clearly understand the expecations in each of their courses.  In order to populate course standards, I used the Common Standards Project API, a database of academic standards from all 50 states, organzations, districts, and schools. Check out https://github.com/commonstandardsproject/api for more information about this amazing project.  As I am just learning to code, and this this is my first Rails application, I decided to work with only one standard group to start--those from my home state of Alabama.

## Usage

Please follow the instructions below to clone the Progress Tracker App repository, start the server, and navigate to http://localhost:3000 in your browser. At the landing page you have the option to Sign in via Facebook, or sign up with an email and password. Once logged in, a student user will be redirected to their personal homepage.

### User Roles/Permissions:

#### Admin: 

  * Responsible for creating, updating, and deleting subjects, sections, and standards from the app's database.
  * Can delete student-owned subjects and standards.
  * Can change a user's permissions or delete a user's account.

#### Student: 

  * Can add subjects from the database to his/her personal homepage.  This creates a unique copy of the subject and the standards for the student.  
  * Can choose a "Progress "Level" and add comments and learning evidence for each standard.

#### Teacher:

  * Can do whatever a student can but also view the progress of individual students.

## Installation

```
git clone git@github.com:jennianelson/progress-tracker-app.git
cd progress_tracker_app
rails db:migrate
rails s
```
Navigate on a browser to: http://localhost:3000

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/'jennifernelson118-67338'/free_group_ex_bham. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).