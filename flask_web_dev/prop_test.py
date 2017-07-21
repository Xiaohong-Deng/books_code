class PropTest:
  def __init__(self, **kwargs):
    self._x = None

  @property
  def foo(self):
    return self._x

  @foo.setter
  def foo(self, value):
    self._x = value

if __name__ == '__main__':
  c = PropTest(foo='set', bar='huh')
  print hasattr(c, 'foo')
  print c.foo
  c.foo = 'cat'
  print c.foo
