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