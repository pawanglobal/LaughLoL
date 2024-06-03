def greet(name):
    print("Hello " + name + "!")
    greet2(name)
    print("Getting ready to say bye")
    bye()

def greet2(name):
    print("how are you " + name + "?")

def bye():
        print("Ok bye")

greet("Pawan")