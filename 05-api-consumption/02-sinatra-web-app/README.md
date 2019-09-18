# Consuming API from Sinatra

Now that we know how to call an API from a Ruby program, we'll call an API directly from a **sinatra web app**.

Let's get back to our guiding theme: activities for team building sessions.

## Setup

Execute the following in the Terminal:

```bash
cd ~/lewagon-workshop/05-api-consumption/02-sinatra-web-app/
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

We have already installed the required Ruby plugins to run the sinatra web application but we are missing `RestClient`.

Execute the following in the Terminal to install it:

```bash
bundle add rest-client
```

## Launching the Sinatra app

Here is a recap on how to launch a Sinatra application.

Type the following in the Terminal:

```bash
ruby app.rb
```

To stop the app, type `Ctrl + c`

⚠ **NOTE:** While the app is running, you can't type anything within your Terminal. If you need to have access to a second Terminal, open a new tab.

## Objectives

The goal of is simple (in itself), previously, we were playing with a Sinatra app with all the data hardcoded within the file `app.rb`.

Let's remove this code and call the [Team Building API](https://team-building-api.cleverapps.io/doc)

### List all activities

First step, in the `app.rb` file, retrieve the activities from the API. Then, display them on your page by completing the `views/index.erb` file.

**HINT:** Feel free to re-use the HTML & CSS you've already defined during the first module.

### Display one activity

Second step, define a new page that would display the informations of only **one activity**. You should call the API to retrieve only one specific activity.

Here is the expected URL of the new page: `/activities/25` where `25` is the ID of the activity.
So, it should also work for `/activities/20`, `/activities/3`, etc.

Do to that, you'll need to understand how to receive and use **parameters**. Have a look at the hints section below.

⚠ **Note:** We should be able to click on an activity from the listing. Don't forget to link (`<a href=...`) your pages to each other.

### Filter activities

In this last step, the plan is to be able to **filter activities** by city.

Add two links to your `index.erb` file. They will point to the following URLs:
- `/?city=Nantes`
- `/?city=Paris`

As a reminder those are parameters defined within the **query string**. See the hints section below on how to access them.
It means that we are not creating a new page, we are using the existing listing on which we provide filtering parameters.

Update your existing code in `app.rb` to accept those parameters and send them to the API.

## Git Commit

When you're done, don't forget to **commit and push** your changes.

## Hints

### Parameters defined in the URL

Given the following code extracted from Sinatra documentation:

```ruby
# app.rb
get "/hello/:name" do
  "Hello #{params["name"]}!"
end
```

The `:` in from of `name` indicates that this part of the URL is dynamic.

It means that the following URLs are valid:
- `/hello/world`
- `/hello/alanis`

To have access to the dynamic part, we have `params`. It's a kind of a `Hash`. So you just provide the key to access the value: `params["name"]`

### Parameters defined in the query string

What if instead of having `/hello/Bob` we have `/hello?name=Bob`

We would have the following code:

```ruby
# app.rb
get "/hello" do
  "Hello #{params["name"]}"
end
```

Again, to access the value stored within `name`, we just call `params["name"]`.
