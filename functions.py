import random

def dumb_function(a):
    return a+1

def risky_function():
    if random.random() < 0.0001:
        return "Oh no... u r ded"
    else:
        return "It's your lucky day!!!"