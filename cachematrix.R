## Put comments here that give an overall description of what your
## functions do

## creates a special object that stores a matrix and cache's its inverse

makeCacheMatrix <- function(x = matrix()) {
	i <- NULL
	set <- function(y) {
		x <<- y
		i <<- NULL	

	}
	get <- function() x
	setinverse <- function(solve) i <<- solve
	getinverse <- function() i
	list( set = set, get = get,
		setinverse = setinverse,
		getinverse = getinverse)	
}


## the following function calculates the inverse of matrix x, it first checks
## to see if the inverse has already been calculated. If so it returns the inverse from the cache
# and skips the computation

cacheSolve <- function(x, ...) {
        i <- x$getinverse()
	if(!is.null(i)) {
		message("getting cached data")
		return(i)
	}
	data <- x$get()
	m <- solve(data, ...)
	x$setinverse(m)
	m
}
