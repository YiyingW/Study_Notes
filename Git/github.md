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
