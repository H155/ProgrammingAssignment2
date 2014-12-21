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