## This function creates a special "matrix" object
## that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
    matrixInverse <- NULL
    set = function(y){
        ##This stores the value in an environment different to 
        ##the current environment, initializes the passed function to x
        ##and the the inverse of a 'currently undefined' null object
        x <<- y
        matrixInverse <<- NULL
    }
    
    get = function(){
        ##Returns the matrix that is passed to the function
        x  
    } 
    setInv = function(inverse){
        ##Sets the passed inverse matrix to be stored in the 
        ##external environment
        matrixInverse <<- inverse  
    } 
    getInv = function(){
        ##Returns the matrix inverse that is stored in the external environment
        matrixInverse
    }
    list(set = set, get = get, setInv = setInv, getInv = getInv)

}

##Computes the inverse of the matrix returned by the makeCacheMatrix() function.
##If it exists, then the inverse is retreived from the cache, otherwise it is computed
##again. 
cacheSolve <- function(x, ...) {
        inverse <- x$getInv()
        
        if(!is.null(inverse)){
            message("getting cached data")
            return(inverse)
        }
        
        mat.data = x$get()
        inv = solve(mat.data, ...)
        
        x$setInv(inverse)
        return(inverse)
}


