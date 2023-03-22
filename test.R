


df = data.frame(

		x = rnorm(100,0,1),
		y = rnorm(100,0,2),
		z = rnorm(100,1,2)
)


write.csv(df, "data.csv")



poisson = data.frame(

		     x = rpois(100,1),
		     y = rpois(100,1)

)

write.csv(poisson, "poisson.csv")

binomial = data.frame(

		      x = rbinom(100, 1, 0.8),
		      y = rbinom(100, 1, 0.6)
)


write.csv(binomial, "binomial.csv")


