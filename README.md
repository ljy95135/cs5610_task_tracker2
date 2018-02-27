# Design
In this task, I find to build a stable project with all features implemented is a extremely hard thing. I, in fact, have to make many choices to finish all requirements, so I will try to make all things clear in choice part so that everyone using this project or see my website will not be obstructed.

## Feature
In this app, you can:
  * Have all features in task1. Except something limit like 15 minutes are removed.
    - Register with name and email and login with email, both of them are unique in database column.
	- You can logout through hyperlink Logout on the top right.
	- When you login, you can use hyperlink on the top right to get to your page.
	- You can see assignment information.
  * The new schema now only allow user to assign works to people they can manage.
  * You will see the infomation of your name, email, your managers and people you manage.
  * You can see your assignments and the assignment condition in the page, for other tasks, you can't see them.
  * Now, time are recorded as many time blocks, you can start and end any number of time blocks you want.
  * AJAX will do partial modification of the page so create, edit and delete action will not refresh the whole page.

## Choice
I will try to talk about all choices as well as a guide of how to use all features in this project. Something is same with the first task and I add some screenshots for convenient this time.
  * If you do not have a use account, register at first.
  * Login with your email you registered.
  * It will redirect to /feed so you can just use the features.
  * However, you can only add assigments after you add management information.
  * Last week, I use name as the input to insert data, but this week I find it quite annoying to remeber names with so much things to test. So, any input like manager, to manage or assigment you give to, should use user_id. I add column for /users, /managements as ID which makes it simple to use.
  * Now you have your manager, but I don't think only one person can give you tasks, at least the user can give himself/herself tasks. So I allow users manage themselves and have more than one managers.
  * If you give tasks to whom you do not manage, it fails.
  * I use a link to edit task so that user can finish the tasks or edit the task information.
  * Now you can see user information section and tasks you need to do and tasks you give.
  * For your tasks, you can use button to start a new work time, then click end, it will add a new time block with AJAX.
  * Delete and Update operation is also AJAX.
  * However, user cannot other's time blocks, even if he/she is the manager, but user can see those time blocks.

## TODO
These are things I think I can do to make it better but the task not requires and time is limited.
  * build a customed form instead of using /users/new and /tasks/:id.
  * All users still have permission to the whole database, which is quite dangerous.
  * You are your manager as well as the one managed is kind of stupid, I should change this self-assign function to another page then it will be much more clearer.


You can see some screenshots. Or just try and enjoy the feature of AJAX!
![test img size](https://raw.githubusercontent.com/ljy95135/task_tracker2/master/screenshots/01.png){:height="50%" width="50%"}
![test img size](https://raw.githubusercontent.com/ljy95135/task_tracker2/master/screenshots/02.png){:height="50%" width="50%"}
![test img size](https://raw.githubusercontent.com/ljy95135/task_tracker2/master/screenshots/03.png){:height="50%" width="50%"}
![test img size](https://raw.githubusercontent.com/ljy95135/task_tracker2/master/screenshots/04.png){:height="50%" width="50%"}

&nbsp;
&nbsp;
Jiangyi Lin

# TaskTracker2

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Install Node.js dependencies with `cd assets && npm install`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](http://www.phoenixframework.org/docs/deployment).

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: http://phoenixframework.org/docs/overview
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix
