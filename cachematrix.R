## Functions to improve performance of matrix calculations
## using caching


## Creates a Matrix object that
## is capable of caching the inverse
makeCacheMatrix <- function(x = matrix()) {
  inverse <- NULL
  getinverse <- function() {
    inverse
  }
  invert <- function() {
    inverse <<- solve(x)
    inverse
  }
  list(getinverse = getinverse, invert = invert)
}

## Function to calculate the inverse 
## of the matrix (created with makeCacheMatrix)
## returning the cahced value if available 
## Otherwise it solves the matrix
cacheSolve <- function(x, ...) {
  myInverse <- x$getinverse()
  if (!is.null(myInverse)) {
    message("getting cached data")
  } else {
    message("No cached data - Calculating and storing")
    myInverse = x$invert()
  }
  myInverse
}
