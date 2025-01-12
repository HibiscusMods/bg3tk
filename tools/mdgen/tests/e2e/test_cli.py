"""End-to-end tests for mdgen CLI."""

import subprocess
import sys

def test_hello_world():
    """Test that running the script prints 'Hello, world!'"""
    result = subprocess.run(
        [sys.executable, "-m", "mdgen"],
        capture_output=True,
        text=True,
        check=True,
    )
    assert result.stdout.strip() == "Hello, world!"
