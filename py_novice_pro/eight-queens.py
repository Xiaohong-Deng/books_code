def conflict(state, nextX):
  nextY = len(state)
  for i in range(nextY):
    if abs(state[i] - nextX) in (0, nextY - i):
      return True
  return False


def queens(num=8, state=()):
  # base case, for the last queen
  # the board size is num by num
  # by using generator we collect all the
  # possible columns fit for the last queen
  for pos in range(num):
    if not conflict(state, pos):
      if len(state) == num - 1:
        yield pos
      else:
        for result in queens(num, state + (pos, )):
          yield (pos, ) + result


def prettyprint(solution):
  def line(pos, length=len(solution)):
    return '. ' * pos + 'X ' + '. ' * (length - pos - 1)
  for pos in solution:
    print(line(pos))
