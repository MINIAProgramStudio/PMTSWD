import functions
import sys
import time

def loop():
    try:
        while True:
            try:
                prompt = float(input())
                print(functions.dumb_function(prompt))
            except:
                sys.stderr.write("Wrong input.")

    except EOFError:
        sys.stderr.write("No more input. Waitmode.")

if __name__ == "__main__":
    while True:
        if sys.stdin.isatty():
            loop()
        else:
            print("Waitmode.")
            time.sleep(1)

# commit trigger