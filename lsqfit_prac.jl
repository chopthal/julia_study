using LsqFit

# t: array of independent variables
# p: array of model parameters

model(t, p) = p[1] * exp.(-p[2] * t)
tdata = LinRange(0,10,20)
ydata = model(tdata, [1.0 2.0]) + 0.01*randn(length(tdata))

p0 = [0.5, 0.5]
fit = curve_fit(model, tdata, ydata, p0)
param = fit.param
cov = estimate_covar(fit)
se = standard_errors(fit)
conf_interval = confidence_interval(fit, 0.1)

