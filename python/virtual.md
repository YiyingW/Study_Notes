* the main purpose of python virtual environment is to create an isolated environment for Python projects. each project can have its own 
dependencies. 
* environments are just directories containing a few scripts. 


* virtualenv is a tool to create isolated python environments. virtualenv creates a folder which contains all the necessary executables to 
use the pacakges that a Python project would need. 
* To install:  
  * `$ pip install virtualenv`
* To create a virtual environment for a project
  * `$ cd my_project_folder`   
   `$ virtualenv my_project` 
  
  `virtualenv my_project` will create a folder in the current directory which will contain the python executable files, and a copy of
  the pip library which you can use to install other packages.   
  
* To use the virtual environment 
  * `$ source my_project/bin/activate` 
  * from now on, any package that you install using pip will be placed in the my_project folder, isolated from the global python 
  installation. 
  
 * To exit virtual environment
  * `$ deactivate` 
  
 * To delete a virtual environment, just delete its folder. 
  * `rm -rf my_project` 
  
 * In order to keep your environment consistent, it's good to freeze the current state of the environment packages. 
  * `$ pip freeze > requirements.txt` 
  * `$ pip install -r requirements.txt` 
  * This can ensure consistency across installations, across deployments, and across developers. 
  
  
[source](http://docs.python-guide.org/en/latest/dev/virtualenvs/)
