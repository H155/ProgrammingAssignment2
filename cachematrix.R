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
