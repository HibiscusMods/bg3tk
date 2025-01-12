"""Unit tests for mdgen."""

from mdgen.__main__ import main

def test_main(capsys):
    """Test that main function prints 'Hello, world!'"""
    main()
    captured = capsys.readouterr()
    assert captured.out == "Hello, world!\n"
