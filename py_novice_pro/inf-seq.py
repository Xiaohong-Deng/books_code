def check_index(key):
  """
  Is  the given an acceptable index?

  To be acceptable, the key should be a non-negative integer. If it
  is not an integer, a TypeError is raised; if it is negative, an
  IndexError is raised (since the sequence is of infinite length).
  """
  if not isinstance(key, int):
    raise TypeError
  if key < 0:
    raise IndexError


class ArithmeticSequence:
  def __init__(self, start=0, step=1):
    self.start = start
    self.step = step
    self.changed = {}

  def __getitem__(self, key):
    check_index(key)

    try:
      return self.changed[key]
    except KeyError:
      return self.start + key * self.step

  def __setitem__(self, key, value):
    check_index(key)
    self.changed[key] = value
