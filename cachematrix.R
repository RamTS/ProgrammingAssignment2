## Writing a pair of functions that cache the inverse of a matrix

## The first function, makeCacheMatrix creates a special "matrix" to
set the value of the matrix
get the value of the matrix
set the value of the inverse
get the value of the inverse

makeCacheMatrix <- function(x = matrix()) {

m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setSolve <- function(Solve) m <<- Solve
        getSolve <- function() m
        list(set = set, get = get,
             setSolve = setSolve,
             getSolve = getSolve)

}


## The following function calculates the inverse of the special "matrix" created with the above function. 
However, it first checks to see if the inverse has already been calculated. 
If so, it gets the inverse from the cache and skips the computation. 
Otherwise, it calculates the inverse of the data and sets the value of the inverse in the cache via the setSolve function.

cacheSolve <- function(x, ...) {
        m <- x$getSolve()
        if(!is.null(m)) {
                message("Getting Cached data")
                return(m)
        }
        data <- x$get()
        m <- Solve(data, ...)
        x$setSolve(m)
        m
}
