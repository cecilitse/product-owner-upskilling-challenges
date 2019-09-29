# Your first commit

Now that your git identity is configured, it's time to play a bit with some of the other git commands.

## Setup

For each exercise, you will have to go in the correct exercise folder of the challenges folder.

Execute the following in the Terminal:

```bash
cd ~/lewagon-workshop/product-owner-upskilling-challenges/01-git-basics/
```

And let's open the code editor:

```bash
code .
```

⚠ **NOTE:** Keep the dot (`.`), it represents the current folder where we are located.

## Exercise

In this folder, you will find three files:

- `README.md` - This is the assignment description that you are currently reading. This file will be present in all the exercises.
- `index.html` - A boilerplate of an HTML file
- `style.css` - A boilerplate of a CSS file

You will work in the `index.html` file and optionally on the `style.css` file.

## Objectives

### A bit of HTML

In the `index.html` file, you'll discover a simple heading and a paragraph. Change at least these two ones.

For the rest, it's up to you and your imagination.

A few ideas though:

- Present yourself: name, picture, hobbies, etc.
- List the places you'd like to go to
- List your favorite sports / movies / books / other

(Optional) Feel free to style the content you display by using the `style.css` file.

### Committing your work

Once you're done, with the HTML part, it's time to **backup** your work. We'll do a **commit**.

Recap of the commands:

```bash
git status
git add <FILENAME_1> <FILENAME_2>
git status
git commit -m "A relevant explanation of the reason of this backup"
git push origin master
```

What did we just do?

- Check the changes
- Add some files to the stage area: those files will be included in the next backup
- Check that the files are now in the stage area
- Trigger a backup
- Send the backup to `origin` which is your challenges repository on GitHub

Feel free to play a bit more with your code, and don't forget to **commit** your changes again!
