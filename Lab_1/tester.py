from functions import dumb_function, risky_function
import random

def test_dumb_function():
    assert dumb_function(1) == 'oogaa-booga, heheheheheeeeeeee'
    assert dumb_function(2) == 'not oogaa-booga'

def test_risky_function():
    random.seed(42)
    assert risky_function() in ["Oh no... u r ded", "It's your lucky day!!!"]