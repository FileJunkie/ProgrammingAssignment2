## Creating a pair of functions to store the cached inverted matrix

## Creating a special "matrix"

makeCacheMatrix <- function(x = matrix()) {
    m <- NULL
    set <- function(y) {
      x <<- y
      m <<- NULL
    }
    get <- function() x
    setinv <- function(solve) m <<- solve
    getinv <- function() m
    list(set = set, get = get,
         setinv = setinv,
         getinv = getinv)
}


## Actully calculating the inverted matrix - if it isn't calculated yet

cacheSolve <- function(x) {
    ## Return a matrix that is the inverse of 'x'
    m <- x$getinv()
    if(!is.null(m)){
      message("getting cached data")
      return(m)
    }
    data <- x$get()
    m <- solve(data)
    x$setinv(m)
    m
}
