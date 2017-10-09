## Three OO systems
* S3 implements a style of OO programming called generic-function OO. A special type of function called a 
generic function decides which method to call. S3 is a very casual system. It has no formal definition of classes. 
* S4 works similarly to S3, but it is more formal. S4 has formal class definitions, which describe the
representation and inheritance for each class, and has special helper functions for defining generics and 
methods. S4 has multiple dispatch, which means that generic functions can pick methods based on the class
of any number of arguments, not just one. 
