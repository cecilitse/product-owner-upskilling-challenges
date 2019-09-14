# Your first Sinatra web app

It's time for you to create your first real **web application**.

We'll transpose our categories listing from the Terminal to the web.

## Setup

Execute the following in the Terminal:

```bash
cd ~/lewagon-workshop/03-sinatra-web-app/
code .
```

## Exercise

In this folder, you will find a lot of files and folders:

- `Gemfile` - It contains the list of the Ruby plugins we rely on to launch the web app.
- `Gemfile.lock` - It contains the exhaustive list of all the plugins needed to launch the web app. Basically, it contains the plugins from the Gemfile + all their dependencies.
- `app.rb` - The entry point of your Sinatra web application.
- `views/index.erb` - The HTML file extended with ERB syntax that is used to display your web page.
- `public/style.css` - A CSS file if you want to style a bit your web page.

You will work in the `app.rb` and `views/index.erb` files and optionally on the `public/style.css` file.

## Installing the plugins

The required Ruby plugins are listed within the `Gemfile`.

We will use **Bundler**, a tool that will read this file and install all the plugins.

Execute the following in the Terminal:

```bash
bundle install
```

By the way, in the Ruby language, plugins are called **gems**.

⚠ **NOTE:** If Bundler is not installed on your computer, execute the following in a Terminal: `gem install bundler`

## Launching the Sinatra app

Type the following in the Terminal:

```bash
ruby app.rb
```

To stop the app, type `Ctrl + c`

⚠ **NOTE:** While the app is running, you can't type anything within your Terminal. If you need to have access to a second Terminal, open a new tab.

## Objectives

The goal is the same as the previous exercise: display a list of activities. The only difference is that this time, we'll display the activities on a **web page**.

As a reminder, a list of activities is represented by an `Array` containing one `Hash` per activity.

First step, in the `app.rb` file, complete the list of activities with at least 3 activities. You can re-use the activities from the previous exercise or invent new ones.

Then, display your activities in the web page by completing the `views/index.rb` file.

**BONUS:** Try to be creative in the way you display your activities.

## Git Commit

When you're done, don't forget to **commit and push** your changes.
