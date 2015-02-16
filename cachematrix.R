## # makeCacheMatrix creates a list containing a function to
# 1. set the value of the matrix
# 2. get the value of the matrix
# 3. set the value of inverse of the matrix
# 4. get the value of inverse of the matrix

makeCacheMatrix <- function(x = numeric()) { # a matrix is as argument
        m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL #cache is set to NULL at first attemt
        }
        get <- function() x
        setsolve <- function(solve) m <<- solve #solve() is applied
        getsolve <- function() m
        list(set = set, get = get,
             setsolve = setsolve,
             getsolve = getsolve)
}
# The cacheSolve function returns the inverse of the matrix. It first checks if
# the inverse has already been computed. If so, it gets the result and skips the
# computation. If not, it computes the inverse, sets the value in the cache via
# setinverse function.
# This function assumes that the matrix is always invertible.

cacheSolve <- function(x, ...) {
        m <- x$getsolve()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)  #result is taken from cache if that's not NULL
        }
        data <- x$get()
        m <- solve(data, ...)
        x$setsolve(m)
        m
}
