## Unix philosophy

*to do one thing well
    * your program only does one thing, reduce the length of code. 
    * simplicity reduces the chances of major bugs
    * easier for users to understand 
    * composability, string several small programs together to make a more complex program
* produce outputs that can be piped into program inputs


## guidelines
* provide as many default values for your functions as is resaonable 
    * if there's an argument in your function that should only be one of a handful of values
    you should use the match.arg() function to check that one of the permitted values is provided.
    * using match.arg() ensures that an error is thrown immediately if an erroneous argument value
    is provides. 
* naming 
    * use snake case and lowercase, with underscore _
    * short
    * meaningful and descriptive 
    * don't assign names that are already taken 
        * apropos()
    
    
