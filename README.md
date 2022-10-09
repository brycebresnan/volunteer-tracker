# Volunteer Tracker

#### By Bryce Bresnan <Bryce.Bresnan@gmail.com>

#### The Volunteer Tracker is a web-based database system built for a non-profit to track projects and volunteers. It allows the user to create, edit, and delete projects, and volunteers. Additionally, you can view which volunteers are assigned to which project and reassign them as needed. 

## Technologies Used

* Ruby
* Sinatra
* Postgress
* SQL


## Setup/Installation Requirements
* Start a Postgress server
* Clone this repository from GitHub.
* Navigate to the root in command line
* Run the following command replacing <code>[DATABASE NAME]/[TEST DATABASE NAME]</code> with your desired database titles.

<code>createdb [DATABASE NAME]
psql [DATABASE_NAME] < database_backup.sql
createdb -T [DATABASE NAME] [TEST DATABASE NAME]</code>

* Run <code>$bundle install</code> to install the required gems.
* Run <code>$ruby app.rb</code> to start the server.
* Navigate in your browser to http://localhost:4567/


## Known Bugs


## License
MIT License

Copyright (c) 2022 Bryce Bresnan

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.