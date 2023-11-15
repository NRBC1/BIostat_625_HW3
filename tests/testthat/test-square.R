test_that("multiplication works", {
  library(datasets)
  data(iris)
  b_l <- basic_linear("Sepal.Length", "Sepal.Width Petal.Length",iris)
  l_E <- l_Estimation(b_l[[3]],b_l[[2]],b_l[[6]],b_l[[7]],b_l[[4]],b_l[[5]])
  l_s <- l_stat(l_E[[1]],l_E[[5]],l_E[[6]],l_E[[7]],b_l[[6]],b_l[[7]],b_l[[2]])
  summary_linear(b_l,l_E,l_s)
  model <- lm(Sepal.Length~Sepal.Width+Petal.Length,data=iris)
  summary(model)
  model_refer <- confint(model)

  expect_equal(as.numeric(l_E[[1]]),as.numeric(model$coefficients))
  expect_equal(as.numeric(l_s[[6]]),as.numeric(model_refer[,1]))
  expect_equal(as.numeric(l_s[[7]]),as.numeric(model_refer[,2]))

})
