#!/usr/bin/env python3
import atexit
import os
import time

from selenium import webdriver
from selenium.webdriver import FirefoxProfile
from selenium.webdriver.firefox.options import Options
import sys

LOG_PATH = "geckodriver.log"


def main(cli=True, observations=100):
    """
    Main code, including selenium driver initialization.

    By default, outputs lines to stdout. If cli=False, the function returns a list of tuples with the resulting lines.
    """
    try:
        # XXX: remove this line to keep the log and continue from where you left off.
        os.remove(LOG_PATH)
    except OSError:
        pass

    profile = FirefoxProfile()
    # The DesiredCapabilities approach does not work with firefox, see https://github.com/mozilla/geckodriver/issues/284
    profile.set_preference("devtools.console.stdout.content", True)
    options = Options()
    options.headless = True
    driver = webdriver.Firefox(firefox_profile=profile, options=options)
    atexit.register(driver.close)

    lines = collect(driver, observations)
    if not cli:
        return lines

    for line in lines:
        print(line)


def collect(driver, observations):
    driver.get("http://localhost:8888")

    # Wait enough time for observations's logs, 5 seconds each
    time.sleep(5 + observations * 5)

    while True:
        lines = list(filter(None, map(parse_tuple, read_log())))
        if len(lines) < observations + 2:
            time.sleep(1)
            continue

        return lines[2:] #discarding first measurements


def read_log(fname=LOG_PATH, prefix='console.log: "('):
    # Example console log that we need has this format:
    # console.log: "(2911814550,289965147,837387141,279155306,310734123)"
    with open(fname) as f:
        return [
            # Strip both the prefix and leading double quotes, leaving just the tuple
            line.lstrip(prefix).rstrip(')"').strip()
            # Make sure that the logs do not contain any leading/trailing whitespace
            for line in map(str.strip, f)
            if line.startswith(prefix)
        ]


def parse_tuple(line):
    try:
        return tuple(int(x) for x in line.split(","))
    except ValueError:
        return None


if __name__ == "__main__":
    main()
