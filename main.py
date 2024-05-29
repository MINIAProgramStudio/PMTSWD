import functions
import sys

def loop():
    prompt = input()
    try:
        prompt = float(prompt)
        print(functions.dumb_function(prompt))
    except:
        sys.stderr.write("wrong input")


if __name__ == "__main__":
    while True:
        loop()