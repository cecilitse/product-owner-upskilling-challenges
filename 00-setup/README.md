# Challenges Setup

If you see this message, it means that you've successfully **forked** the challenges repository.

What now? Well, the repository is present only on your GitHub account. It's now time to download it on your own computer.

## Creating a workspace

Let's create a space where we will put all our exercises and projects.

Execute the following in the Terminal:

```bash
cd ~
mkdir lewagon-workshop
cd lewagon-workshop
```

What did we just do?

- Go inside the home (`~`) folder
- Create a new folder named `lewagon-workshop`
- Go inside `lewagon-workshop` folder

⚠ **NOTE:** Please avoid moving or renaming this folder during the whole worshop duration as we'll have to go within it quite often.

## Downloading the challenges

We will now download the challenges repository within the `lewagon-workshop` folder.

Execute the following in the Terminal:

```bash
# Just in case you went elsewhere in between ;)
cd ~/lewagon-workshop

git clone git@github.com:<GITHUB_USERNAME>/product-owner-upskilling.git
```

⚠ **NOTE:** Where `<GITHUB_USERNAME>` should be replaced by **your GitHub username**.

The **git clone** command downloads the repository with the history of all the commits already done on it.

## Checking

The previous command should have created a `product-owner-upskilling` folder within the `lewagon-workshop` folder. Let's check that.

Execute the following in the Terminal:

```bash
# Just in case you went elsewhere in between (we never know!)
cd ~/lewagon-workshop
ls
```

The result of the `ls` command should print out `product-owner-upskilling` in the Terminal.

If it's not the case, ask for help!
Otherwise, the setup is now done, you're ready to work on your first challenge!
