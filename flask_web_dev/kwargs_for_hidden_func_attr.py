class hidden_attr:
  attr1 = 9
  attr2 = 'attr2'

  def __init__(self, **kwargs):
    if kwargs.get('attr1') is not None:
      self.attr1 = kwargs[attr1]
    if kwargs.get('attr2') is not None:
      self.attr2 = kwargs[attr2]

if __name__ == '__main__':
  print hidden_attr.attr1
  test_case = hidden_attr(attr1 = 10, attr2 = 'keywords')
  print test_case.role is None
  print test_case.attr1
  print test_case.attr2
