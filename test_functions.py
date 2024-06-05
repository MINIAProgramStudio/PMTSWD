import unittest
from functions import *
import random

class TestFunctions(unittest.TestCase):
    def test_dumb_function_int(self):
        for i in range(10000):
            prompt = int(random.random()*100000) - 50000
            self.assertEqual(dumb_function(prompt), prompt+1)

    def test_dumb_function_float(self):
        for i in range(100000):
            prompt = random.random()*10000 - 5000
            self.assertEqual(dumb_function(prompt), prompt+1)

    def test_dumb_function_faulty_input(self):
        prompt = "a"
        self.assertEqual(dumb_function(prompt), None)