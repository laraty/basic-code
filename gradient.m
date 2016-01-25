function g = gradient(z)
g = sigmoid(z).*(1-sigmoid(z));
end
