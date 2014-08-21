## This function will compute and cache the inverse of a matrix.
## allowing the inverse to be used multiple times without needing
## to compute it each time.

## This function will store the inverse of the matrix in cache.

makeCacheMatrix <- function(x = matrix()) {
  i <- NULL
  get <- function() {
    x
  }
  setinversT<- function(solve) {
    i <<- solve
  }
  getinverse <- function() {
    i
  }
  list(get = get, setinverse = setinverse,
       getinverse = getinverse)
}


## This function will return the inverse of the matrix. If it is
## already stored in makeCacheMatrix, it will return the cached inverse
## otherwise it will calculate it and return that calculation.

cacheSolve <- function(x, ...) {
        
  i <- x$getinverse()
  if(!is.null(i)) {
    message("getting cached data")
    return(i) ## Return a matrix that is the inverse of 'x' cached
  }
  data <- x$get()
  i <- solve(data)
  x$setinverse(i) ## Stores inverse in cache
  return(i)  ## Return a matrix that is the inverse of 'x' computed
}
