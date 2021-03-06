#!/usr/bin/env python

import unittest
from selenium import webdriver


class TestIBMHomepage(unittest.TestCase):
    
    def setUp(self):
        self.browser = webdriver.Firefox()
        
    def testTitle(self):
        self.browser.get('https://www.ibm.com/in-en/')
        self.assertIn('IBM - India', self.browser.title)
        
    def tearDown(self):
        self.browser.quit()


if __name__ == '__main__':
    unittest.main(verbosity=2)
