import main
import unittest
from unittest.mock import patch

class TestMain(unittest.TestCase):

    @patch('builtins.print')
    @patch('builtins.input', side_effect=['10'])
    def test_ok(self,_, mock_print):
        main.loop()
        mock_print.assert_called_with(11.0)

    @patch('sys.stderr.write')
    @patch('builtins.input', side_effect=['a'])
    def test_not_ok(self,_, mock_err):
        main.loop()
        mock_err.assert_called_with("wrong input")