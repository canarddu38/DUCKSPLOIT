import mouse


with open('action.txt') as f:
    action = f.readlines()


#  click
mouse.click(action)