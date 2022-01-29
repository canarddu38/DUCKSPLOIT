import mouse

with open('action.txt') as f:
    action = f.readlines()

# get the position of mouse
print(mouse.get_position())