from tkinter import *
from tkinter.scrolledtext import ScrolledText


def load():
  with open(filename.get()) as file:
    # delete every between line 1 char 0 to END
    # INSERT is the current insertion point
    contents.delete('1.0', END)
    contents.insert(INSERT, file.read())


def save():
  with open(filename.get(), 'w') as file:
    file.write(contents.get('1.0', END))


# initialize window widget
top = Tk()
top.title("Simple Editor")


# initialize text field with scroll bar
contents = ScrolledText()
# pack manager
contents.pack(side=BOTTOM, expand=True, fill=BOTH)


# text field
filename = Entry()
filename.pack(side=LEFT, expand=True, fill=X)


Button(text='Open', command=load).pack(side=LEFT)
Button(text='Save', command=save).pack(side=LEFT)

mainloop()
