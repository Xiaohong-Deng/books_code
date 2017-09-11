def flatten(nested):
  try:
    # do not iterate over strings
    try:
      nested + ''
    except TypeError:  # if nested is not a string let the following code deal with it
      pass
    else:
      raise TypeError
    for sublist in nested:
      for element in flatten(sublist):
        yield element
  except TypeError:
    yield nested
