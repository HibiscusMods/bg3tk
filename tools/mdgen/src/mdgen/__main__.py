"""Main entry point for mdgen."""
import os

def main():
    """Entry point for the application."""
    print(os.environ.get("VIRTUAL_ENV"))
    print("Hello, world!")

if __name__ == "__main__":
    main()
