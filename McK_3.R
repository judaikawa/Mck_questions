# HackerRank

# Inclusive range given by [lower,upper]
# Determine how many candidated the company will extend offers

# 1. array of n int, list of candidate scores
# 2. array of q int, lowerLimits
# 3. array of q int, upperLimits

q = 2
lowerLimits = c(1,1)
upperLimits = c(5,8)
scores = c(0,2,4,9,10,6,4,7,7)
  
answer <- c()
for (i in 1:q) {
  answer <- append(answer, sum(scores >= lowerLimits[i] & scores <= upperLimits[i]))
}

answer
