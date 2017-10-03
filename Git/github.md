## GitHub Intro
* can post R packges on GitHub and with the install_github function from the devtools 
package, install R packages directly from GitHub. 
* three levels of tasks
  * initial set-up (do once per computer)
    * download git
    * configure git with your user name and email
    * set up a github account
    * set up a SSH key to link RStudio on your personal computer with your GitHub account
  * set-up of a specific repository (need to do every time you create a new repository)
    * initialize the directory on your personal computer as a git repository 
    * make an initial commit of files in the repo
    * create an empty GitHub repository
    * add the github repo as a remote branch of the local repo
    * push the local repo to the github remote branch
    * if you are starting from a github repo rather than a local repo, either clone
    the repo or fork and clone the repo instead. 
  * day-to-day workflow for a repo - do regularly as developing the code in a repo
    * commit changes in files in the repo to save git history locally
    * push committed changes to the github remote branch
    * pull the latest version of the github remote branch to incorporate changes from
    collaborators into the repo code saved on computer
    * write and resolve issues with the code in the repo
    * fix and merge conflicts that come up between different collaborators' code edits
    * if the repo is a fork, keep up-to-date with changes in the upstream branch


## configure git
* include your name and email address as the user.name and user.email    
```
git config --global user.name "Jane Doe"
git config --global user.email "jane.doe@university.edu"
```
## initialize a git repo
* using commands from a bash shell 
  * from terminal, navigate to the directory. 
  * check that it is not already a git repo. 
  ```
  git status
  ```
  * initialize it as a repo
  ```
  git init
  ```
* directly from RStudio 
  * make the directory an R project. File -> New Project -> Existing Directory 
  * open the R project
  * Tools -> Version Control -> Project Setup
  * in the box for "Version control system", choose "Git"
  * should have a Git window in one of RStudio panes.
## Commit changes
* make git commits from the RStudio
  * "Commit" button in the Git window 
  
## Host git repo online
* work collaboratively on a shared repo
* fork someone else's repo to create your own copy so you can use and change
* suggest changes to other people's repo through pull requests 
* if you have a local directory that you would like to push to GitHub
  * make sure that the directory is under git version control 
  * create an empty repo on github to sync with your local repo   
  * connect the two repos
    * adding SSH key from RStudio to your GitHub account with the following steps
      1. In RStudio, go to “RStudio” -> “Preferences” -> “Git / svn”. Choose to “Create RSA key”.
      1. Click on “View public key”. Copy everything that shows up.
      1. Go to your GitHub account and navigate to “Settings”. Click on “SSH and GPG keys”.
      1. Click on “New SSH key”. Name the key something like “mylaptop”. Paste in your public key in the “Key box”.
  
## Push local repo to the empty GitHub repo
* in shell, navigate to the directory you want to push
* add the github repo as a remote branch 
```
git remote add origin url
```
* push the contents of the local repo to the GitHub repo
```
git push -u origin master
```
* to pull a repo 
```
git clone url
```
## Issues
* each origin GitHub repo has a tab for "issues" which works like a discussion forum. 
## pull request
* use a pull request to suggest changes to a repo that you don't own 
  * fork the repo
  * make changes (locally or on GitHub)
  * save your changes and commit them
  * submit a pull request to the original repo
  * the owner can merge the changes into the original repo, or if there are conflicts, 
  the conflicts need to be resolved before the pull request can be merged. 
## merge conflicts
come up in a few situations   
* pull in commits from the GitHub branch of a repo you've been working on locally
* someone sends a pull request for one of your repo, and you have updated some of the code
between when the person forked the repo and submitted the pull request

